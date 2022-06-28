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

// ************************************ Salesforce rest client constants ***********************************************

# Constant field `API_VERSION`. Holds the value for the Salesforce API version.
public const string API_VERSION = "v48.0";

// For URL encoding
# Constant field `ENCODING_CHARSET`. Holds the value for the encoding charset.
const string ENCODING_CHARSET = "utf-8";

//Salesforce endpoints
# Constant field `BASE_PATH`. Holds the value for the Salesforce base path/URL.
const string BASE_PATH = "/services/data";

# Constant field `API_BASE_PATH`. Holds the value for the Salesforce API base path/URL.
final string API_BASE_PATH = string `${BASE_PATH}/${API_VERSION}`;

# Constant field `SOBJECTS`. Holds the value sobjects for get sobject resource prefix.
const string SOBJECTS = "sobjects";

# Constant field `LIMITS`. Holds the value limits for get limits resource prefix.
const string LIMITS = "limits";

# Constant field `DESCRIBE`. Holds the value describe for describe resource prefix.
const string DESCRIBE = "describe";

# Constant field `search`. Holds the value search for SOSL search resource prefix.
const string SEARCH = "search";

# Constant field `PLATFORM_ACTION`. Holds the value PlatformAction for resource prefix.
const string PLATFORM_ACTION = "PlatformAction";

// Query param names
const string QUERY = "query";

# Constant field `FIELDS`. Holds the value fields for resource prefix.
const string FIELDS = "fields";

# Constant field `q`. Holds the value q for query resource prefix.
const string Q = "q";

# Constant field `QUESTION_MARK`. Holds the value of "?".
const string QUESTION_MARK = "?";

# Constant field `EQUAL_SIGN`. Holds the value of "=".
const string EQUAL_SIGN = "=";

# Constant field `EMPTY_STRING`. Holds the value of "".
public const string EMPTY_STRING = "";

# Constant field `AMPERSAND`. Holds the value of "&".
const string AMPERSAND = "&";

# Constant field `FORWARD_SLASH`. Holds the value of "/".
const string FORWARD_SLASH = "/";

# Next records URl
const NEXT_RECORDS_URL = "nextRecordsUrl";

const ATTRIBUTES = "attributes";

const string ERR_EXTRACTING_ERROR_MSG = "Error occured while extracting errors from payload.";
const INVALID_CLIENT_CONFIG = "Invalid values provided for client configuration parameters.";