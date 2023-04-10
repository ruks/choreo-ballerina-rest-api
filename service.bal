import ballerina/http;

// Define a configuration object with a default value
configurable string serviceName = ?;

// Define a simple HTTP service
service /helloWorld on new http:Listener(9090) {
    resource function post greeting() returns string {
        string message = string `Hello ${serviceName}!`;
        return message;
    }
}
