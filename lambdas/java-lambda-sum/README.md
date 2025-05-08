# Java Lambda Sum

This project demonstrates a simple Java application that sums two numbers provided as command-line arguments.

## Project Structure

```
java-lambda-sum
├── src
│   └── main
│       └── java
│           └── SumLambda.java
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

## Running the Sum Function

After building the project, you can run the sum function using the following command:

```
mvn exec:java -Dexec.mainClass="SumLambda" -Dexec.args="num1 num2"
```

Replace `num1` and `num2` with the numbers you want to sum. You should see the output:

```
Sum: <result>
```

## License

This project is licensed under the MIT License.