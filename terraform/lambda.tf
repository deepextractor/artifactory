######################################### Hello lambda ##########################################
resource "aws_lambda_function" "hello_lambda" {
  architectures = ["x86_64"]
  description   = "Lambda that prints hello"
  function_name = "adhoc-extractor-hello-lambda-DEV"
  filename      = data.artifactory_file.hello_lambda.output_path
  handler       = "HelloLambda"
  memory_size   = "512"
  package_type  = "Zip"
  role          = "arn:aws:iam::${var.account_id}:role/Extractor"
  runtime       = "java11"
  timeout       = "120"
  publish       = true

  snap_start {
    apply_on = "PublishedVersions"
  }

  vpc_config {
    security_group_ids = var.vpc_security_group_ids
    subnet_ids         = var.vpc_subnet_ids
  }

  tags = {
    Name = "adhoc-extractor-hello-lambda-DEV"
  }

  provisioner "local-exec" {
    command = "rm -rf /tmp/hello-lambda-*.jar"
  }
}

resource "aws_lambda_alias" "hello_lambda_alias" {
  name             = "hello_lambda_snap_start"
  description      = "Alias for SnapStart for Hello Lambda"
  function_name    = aws_lambda_function.hello_lambda.function_name
  function_version = aws_lambda_function.hello_lambda.version
}