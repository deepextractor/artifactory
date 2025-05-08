# Java Lambda Hello

This project demonstrates a simple Java lambda expression that prints "Hello, World!" to the console.

## Project Structure

```
java-lambda-hello
├── src
│   └── main
│       └── java
│           └── HelloLambda.java
├── pom.xml
└── README.md
```

## Prerequisites

- Java Development Kit (JDK) 8 or higher
- Apache Maven

## Building the Project

To build the project, navigate to the project directory and run the following command:

```
mvn clean package
```

## Running the Lambda Function

After building the project, you can run the lambda function using the following command:

```
mvn exec:java -Dexec.mainClass="HelloLambda"
```

This will execute the `HelloLambda` class, and you should see the output:

```
Hello, World!
``` 

## License

This project is licensed under the MIT License.