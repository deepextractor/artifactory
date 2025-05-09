FROM public.ecr.aws/lambda/python:3.8

# Set the working directory
WORKDIR /var/task

# Copy the requirements file and install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY app.py ./

# Command to run the Lambda function
CMD ["app.lambda_handler"]