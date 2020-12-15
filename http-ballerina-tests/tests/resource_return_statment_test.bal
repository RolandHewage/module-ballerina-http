// // Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
// //
// // WSO2 Inc. licenses this file to you under the Apache License,
// // Version 2.0 (the "License"); you may not use this file except
// // in compliance with the License.
// // You may obtain a copy of the License at
// //
// // http://www.apache.org/licenses/LICENSE-2.0
// //
// // Unless required by applicable law or agreed to in writing,
// // software distributed under the License is distributed on an
// // "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// // KIND, either express or implied.  See the License for the
// // specific language governing permissions and limitations
// // under the License.

// import ballerina/test;
// import ballerina/http;

// listener http:Listener resourceReturnTestEP = new(resourceReturnTest);
// http:Client resourceReturnTestClient = new("http://localhost:" + resourceReturnTest.toString());

// service http:Service /mytest on basePathTestEP {
//     resource function get test1(http:Caller caller) {
//         var result = caller->respond("hello");
//         return;
//     }
    
//     resource function get test2(http:Caller caller) {
//         var result = caller->respond("hello");
//         return "world";
//     }
// }

// @test:Config {}
// public function testBasePathSpecialChars() {
//     http:Request req = new;
//     var resp = basePathTestClient->get("/my/Tes%40tHello/go/foo");
//     if (resp is http:Response) {
//         assertTextPayload(resp.getTextPayload(), "special dispatched");
//     } else if (resp is error) {
//         test:assertFail(msg = "Found unexpected output: " +  resp.message());
//     }
// }

// @test:Config {}
// public function testBasePathAsString() {
//     http:Request req = new;
//     var resp = basePathTestClient->get("/Tes%40tHello/go/foo");
//     if (resp is http:Response) {
//         assertTextPayload(resp.getTextPayload(), "string dispatched");
//     } else if (resp is error) {
//         test:assertFail(msg = "Found unexpected output: " +  resp.message());
//     }
// }


// @test:Config {}
// public function testMGWVersionBasePath() {
//     http:Request req = new;
//     var resp = basePathTestClient->get("/myservice/andversion/a%2Fb/id");
//     if (resp is http:Response) {
//         assertTextPayload(resp.getTextPayload(), "service/version/1/1/id");
//     } else if (resp is error) {
//         test:assertFail(msg = "Found unexpected output: " +  resp.message());
//     }
// }
