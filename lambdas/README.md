# lambdas/README.md

# Lambdas Directory

This directory contains various AWS Lambda functions implemented in different programming languages. Currently, it includes:

## Java Lambdas

The existing Java Lambdas are packaged as JAR files and are deployed using Maven. You can find the Java Lambda implementations in their respective folders.

## Python Lambda

A new Python Lambda has been added to this directory. The Python Lambda is structured as follows:

- **python_lambda/**: Contains the implementation of the Python Lambda function.
  - **app.py**: The main logic for the Python Lambda function, defining the handler that AWS Lambda invokes.
  - **Dockerfile**: Used to build a Docker image for the Python Lambda, specifying the base image and dependencies.
  - **requirements.txt**: Lists the Python dependencies required for the Lambda function.
  - **README.md**: Documentation for the Python Lambda, including instructions on building the Docker image and deploying it to GitHub Packages.

For more details on the Python Lambda, please refer to the `python_lambda/README.md` file.