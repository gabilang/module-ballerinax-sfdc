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

import ballerina/log;
import ballerinax/salesforce as sfdc;

// Create Salesforce client configuration by reading from config file.
sfdc:ConnectionConfig sfConfig = {
    baseUrl: "<BASE_URL>",
    clientConfig: {
        clientId: "<CLIENT_ID>",
        clientSecret: "<CLIENT_SECRET>",
        refreshToken: "<REFESH_TOKEN>",
        refreshUrl: "<REFRESH_URL>"
    }
};

// Create Salesforce client.
sfdc:Client baseClient = check new (sfConfig);

public function main() returns error? {

    string productId = check getProductIdByName("P2");

    json productRecord = {
        Name: "Test Product"
    };

    sfdc:Error? res = baseClient->updateProduct(productId, productRecord);

    if res is sfdc:Error {
        log:printError(res.message());
    } else {
        log:printInfo("Product updated successfully");
    }

}

function getProductIdByName(string name) returns string|error {
    string productId = "";
    string sampleQuery = "SELECT Id FROM Product2 WHERE Name='" + name + "'";
    stream<record {}, error?> queryResults = check baseClient->getQueryResultStream(sampleQuery);
    ResultValue|error? result = queryResults.next();
    if result is ResultValue {
        productId = check result.value.get("Id").ensureType();
    } else {
        log:printError(msg = "Getting Product ID by name failed.");
    }
    return productId;
}

type ResultValue record {|
    record {} value;
|};
