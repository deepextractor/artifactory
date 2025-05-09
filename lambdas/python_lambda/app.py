def lambda_handler(event, context):
    # Main logic for the Python Lambda function
    # Process the incoming event and return a response
    response = {
        "statusCode": 200,
        "body": "Hello from Python Lambda!"
    }
    return response