import ballerina/http;
import ballerina/log;

configurable string mocky_url = ?;

public isolated client class Client {
    final http:Client clientEp;

    public isolated function init() returns error? {

        http:Client httpEp = check new (mocky_url);
        self.clientEp = httpEp;
        return;
    }

    remote isolated function getMockResponse() returns json|error {

        string resourcePath = string ``;
        json response = check self.clientEp->get(resourcePath);
        log:printInfo("Retrieved response from mocky : " + response.toJsonString());
        return response;
    }
}
