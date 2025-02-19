// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/log;
import ballerina/test;

http:ListenerConfiguration http2SslServiceConf = {
    secureSocket: {
        key: {
            path: "tests/certsandkeys/ballerinaKeystore.p12",
            password: "ballerina"
        }
    },
    httpVersion: "2.0"
};

listener http:Listener http2SslListener = new(9206, http2SslServiceConf);

service /http2Service on http2SslListener {

    resource function get .(http:Caller caller, http:Request req) {
        error? result = caller->respond("Hello World!");
        if (result is error) {
            log:printError("Failed to respond", 'error = result);
        }
    }
}

http:ClientConfiguration http2SslClientConf1 = {
    secureSocket: {
        cert: {
            path: "tests/certsandkeys/ballerinaTruststore.p12",
            password: "ballerina"
        }
    },
    httpVersion: "2.0"
};

@test:Config {}
public function testHttp2Ssl1() {
    http:Client clientEP = checkpanic new("https://localhost:9206", http2SslClientConf1);
    http:Response|error resp = clientEP->get("/http2Service/");
    if (resp is http:Response) {
        assertTextPayload(resp.getTextPayload(), "Hello World!");
    } else {
        test:assertFail(msg = "Found unexpected output: " +  resp.message());
    }
}

http:ClientConfiguration http2SslClientConf2 = {
    httpVersion: "2.0"
};

@test:Config {}
public function testHttp2Ssl2() {
    http:Client|http:ClientError httpClient = new("https://localhost:9206", http2SslClientConf2);
    if (httpClient is http:ClientError) {
        test:assertEquals(httpClient.message(), "The secureSocket configuration should be provided to establish an HTTPS connection");
    } else {
        test:assertFail(msg = "Found unexpected output: Expected an error message for not configuring secureSocket");
    }
}
