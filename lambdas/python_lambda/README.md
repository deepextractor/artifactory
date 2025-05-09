# Python Lambda

This directory contains the implementation of a Python Lambda function. The main components of this project are as follows:

## Files

- **app.py**: This file contains the main logic for the Python Lambda function. It defines the handler function that AWS Lambda will invoke, processing incoming events and returning responses.

- **Dockerfile**: This file is used to build a Docker image for the Python Lambda. It specifies the base image, installs dependencies from `requirements.txt`, and sets the command to run the Lambda function.

- **requirements.txt**: This file lists the Python dependencies required for the Lambda function. It will be used by the Dockerfile to install the necessary packages.

## Building the Docker Image

To build the Docker image for the Python Lambda, navigate to the `python_lambda` directory and run the following command:

```bash
docker build -t python-lambda .
```

## Deploying to GitHub Packages

Once the Docker image is built, you can push it to GitHub Packages using the following command:

```bash
docker push <your-github-username>/python-lambda:latest
```

Make sure to replace `<your-github-username>` with your actual GitHub username.

## Usage

After deploying the Docker image, you can use it in your AWS Lambda function by specifying the image URI in the Lambda configuration.