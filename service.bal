import ballerina/http;

Client mockyClient = check new();

service / on new http:Listener(9090) {

    resource function get mocky() returns json|error {
        return mockyClient->getMockResponse();
    }
}
