//
// Copyright (c) 2019, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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
//

# XML delete operator client.
public type XmlDeleteOperator client object {
    Job job;
    SalesforceBaseClient httpBaseClient;

    public function __init(Job job, SalesforceConfiguration salesforceConfig) {
        self.job = job;
        self.httpBaseClient = new(salesforceConfig);
    }

    # Create XML delete batch.
    #
    # + payload - delete data with IDs in XML format
    # + return - Batch record if successful else SalesforceError occured
    public remote function delete(xml payload) returns @tainted Batch | SalesforceError {
        xml | SalesforceError xmlResponse = self.httpBaseClient->createXmlRecord([JOB, self.job.id, BATCH], payload);
        if (xmlResponse is xml) {
            Batch | SalesforceError batch = getBatch(xmlResponse);
            return batch;
        } else {
            return xmlResponse;
        }
    }

    # Get XML delete operator job information.
    #
    # + return - Job record if successful else SalesforceError occured
    public remote function getJobInfo() returns @tainted  Job | SalesforceError {
        xml | SalesforceError xmlResponse = self.httpBaseClient->getXmlRecord([JOB, self.job.id]);
        if (xmlResponse is xml) {
            Job | SalesforceError job = getJob(xmlResponse);
            return job;
        } else {
            return xmlResponse;
        }
    }

    # Close XML delete operator job.
    #
    # + return - Job record if successful else SalesforceError occured
    public remote function closeJob() returns @tainted Job | SalesforceError {
        xml | SalesforceError xmlResponse = self.httpBaseClient->createXmlRecord([JOB, self.job.id], 
        XML_STATE_CLOSED_PAYLOAD);
        if (xmlResponse is xml) {
            Job | SalesforceError job = getJob(xmlResponse);
            return job;
        } else {
            return xmlResponse;
        }
    }

    # Abort XML delete operator job.
    #
    # + return - Job record if successful else SalesforceError occured
    public remote function abortJob() returns @tainted Job | SalesforceError {
        xml | SalesforceError xmlResponse = self.httpBaseClient->createXmlRecord([JOB, self.job.id], 
        XML_STATE_ABORTED_PAYLOAD);
        if (xmlResponse is xml) {
            Job | SalesforceError job = getJob(xmlResponse);
            return job;
        } else {
            return xmlResponse;
        }
    }

    # Get XML delete batch information.
    #
    # + batchId - batch ID 
    # + return - Batch record if successful else SalesforceError occured
    public remote function getBatchInfo(string batchId) returns @tainted  Batch | SalesforceError {
        xml | SalesforceError xmlResponse = self.httpBaseClient->getXmlRecord([JOB, self.job.id, BATCH, batchId]);
        if (xmlResponse is xml) {
            Batch | SalesforceError batch = getBatch(xmlResponse);
            return batch;
        } else {
            return xmlResponse;
        }
    }

    # Get information of all batches of XML delete operator job.
    #
    # + return - BatchInfo record if successful else SalesforceError occured
    public remote function getAllBatches() returns @tainted BatchInfo | SalesforceError {
        xml | SalesforceError xmlResponse = self.httpBaseClient->getXmlRecord([JOB, self.job.id, BATCH]);
        if (xmlResponse is xml) {
            BatchInfo | SalesforceError batchInfo = getBatchInfo(xmlResponse);
            return batchInfo;
        } else {
            return xmlResponse;
        }
    }

    # Retrieve the XML batch request.
    #
    # + batchId - batch ID
    # + return - JSON Batch request if successful else SalesforceError occured
    public remote function getBatchRequest(string batchId) returns @tainted  xml | SalesforceError {
        return self.httpBaseClient->getXmlRecord([JOB, self.job.id, BATCH, batchId, REQUEST]);
    }

    # Get the results of the batch.
    #
    # + batchId - batch ID
    # + numberOfTries - number of times checking the batch state
    # + waitTime - time between two tries in ms
    # + return - Batch result as CSV if successful else SalesforceError occured
    public remote function getResult(string batchId, int numberOfTries = 1, int waitTime = 3000) 
        returns @tainted Result[]|SalesforceError {
        return checkBatchStateAndGetResults(getBatchPointer, getResultsPointer, self, batchId, numberOfTries, waitTime);        
    }
};
