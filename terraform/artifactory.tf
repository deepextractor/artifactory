# Configure the Artifactory provider
provider "artifactory" {
  url     = "https://maven.pkg.github.com/deepextractor/"
  access_token = var.ARTIFACTORY_TOKEN
}

resource "null_resource" "pre_provision" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = <<EOT
        rm -rf /tmp/* && 
        yum install awscli -y
    EOT
  }
}

data "artifactory_file" "hello_lambda" {
  repository  = "artifactory"
  path        = "com/github/deepextractor/hello-lambda/1.0.3/hello-lambda-1.0.3.jar"
  output_path = "/tmp/hello-lambda-1.0.3.jar"
  depends_on  = [null_resource.pre_provision]
}