package Database;

/*
 * Copyright 2012-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */
import java.util.HashMap;
import java.util.Map;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.model.AttributeDefinition;
import com.amazonaws.services.dynamodbv2.model.AttributeValue;
import com.amazonaws.services.dynamodbv2.model.AttributeValueUpdate;
import com.amazonaws.services.dynamodbv2.model.AttributeAction;
import com.amazonaws.services.dynamodbv2.model.AttributeDefinition;
import com.amazonaws.services.dynamodbv2.model.ComparisonOperator;
import com.amazonaws.services.dynamodbv2.model.Condition;
import com.amazonaws.services.dynamodbv2.model.CreateTableRequest;
import com.amazonaws.services.dynamodbv2.model.DescribeTableRequest;
import com.amazonaws.services.dynamodbv2.model.DescribeTableResult;
import com.amazonaws.services.dynamodbv2.model.GetItemRequest;
import com.amazonaws.services.dynamodbv2.model.GetItemResult;
import com.amazonaws.services.dynamodbv2.model.KeySchemaElement;
import com.amazonaws.services.dynamodbv2.model.KeyType;
import com.amazonaws.services.dynamodbv2.model.ProvisionedThroughput;
import com.amazonaws.services.dynamodbv2.model.PutItemRequest;
import com.amazonaws.services.dynamodbv2.model.PutItemResult;
import com.amazonaws.services.dynamodbv2.model.QueryResult;
import com.amazonaws.services.dynamodbv2.model.ScalarAttributeType;
import com.amazonaws.services.dynamodbv2.model.ScanRequest;
import com.amazonaws.services.dynamodbv2.model.ScanResult;
import com.amazonaws.services.dynamodbv2.model.TableDescription;
import com.amazonaws.services.dynamodbv2.util.Tables;
import com.amazonaws.services.dynamodbv2.model.QueryRequest;
import com.amazonaws.services.dynamodbv2.model.QueryResult;
import com.amazonaws.services.dynamodbv2.model.UpdateItemRequest;
import com.amazonaws.services.dynamodbv2.model.UpdateItemResult;
import com.amazonaws.services.dynamodbv2.model.ReturnValue;

import com.amazonaws.services.ec2.model.transform.ReplaceNetworkAclAssociationResultStaxUnmarshaller;
import java.util.ArrayList;

import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBMapper;
import java.io.PrintWriter;
import java.util.Arrays;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * This sample demonstrates how to perform a few simple operations with the
 * Amazon DynamoDB service.
 */
public class CustomerData {

    static String tableName = "MemberData";
    static String customerId = "1111";
    static String customerName = "rin";
    static String customerEmail = "mail";
    static ArrayList<String> Newstreams = new ArrayList<>();

    public CustomerData(String Id, String Name, String CustomerEmail) {

    }

    public CustomerData(String Id) {
        customerId = Id;
    }


    static AmazonDynamoDBClient dynamoDB;

    /**
     *
     *
     * @see com.amazonaws.auth.BasicAWSCredentials
     * @see com.amazonaws.auth.ProfilesConfigFile
     * @see com.amazonaws.ClientConfiguration
     */
    private static void init() throws Exception {

        AWSCredentials credentials = null;
        try {
            credentials = new ProfileCredentialsProvider().getCredentials();
        } catch (Exception e) {
            throw new AmazonClientException(
                    "Cannot load the credentials from the credential profiles file. "
                    + "Please make sure that your credentials file is at the correct "
                    + "location (~/.aws/credentials), and is in valid format.",
                    e);
        }
        dynamoDB = new AmazonDynamoDBClient(credentials);
        Region usWest2 = Region.getRegion(Regions.US_WEST_2);
        dynamoDB.setRegion(usWest2);
        dynamoDB.setEndpoint("http://localhost:8000");
    }

    public static void main(String[] args) throws Exception {
        init();

        try {

            // Create table if it does not exist yet
            if (Tables.doesTableExist(dynamoDB, tableName)) {
                System.out.println("Table " + tableName + " is already ACTIVE");

            } else {
                // Create a table with a primary hash key Idd 'Id', which holds a string
                CreateTableRequest createTableRequest = new CreateTableRequest().withTableName(tableName)
                        .withKeySchema(new KeySchemaElement().withAttributeName("Id").withKeyType(KeyType.HASH))
                        .withAttributeDefinitions(new AttributeDefinition().withAttributeName("Id").withAttributeType(ScalarAttributeType.S))
                        .withProvisionedThroughput(new ProvisionedThroughput().withReadCapacityUnits(1L).withWriteCapacityUnits(1L));
                TableDescription createdTableDescription = dynamoDB.createTable(createTableRequest).getTableDescription();
                System.out.println("Created Table: " + createdTableDescription);

                // Wait for it to become active
                System.out.println("Waiting for " + tableName + " to become ACTIVE...");
                Tables.waitForTableToBecomeActive(dynamoDB, tableName);

                // Describe our new table
                DescribeTableRequest describeTableRequest = new DescribeTableRequest().withTableName(tableName);
                TableDescription tableDescription = dynamoDB.describeTable(describeTableRequest).getTable();
                System.out.println("Table Description: " + tableDescription);

                // Add an item
                Map<String, AttributeValue> item = newItem("Nine Creatives on Creativity", "SQ_NS001", 2014, "Squashouse", "Video");
                PutItemRequest putItemRequest = new PutItemRequest(tableName, item);
                PutItemResult putItemResult = dynamoDB.putItem(putItemRequest);

            }

        } catch (AmazonServiceException ase) {
            System.out.println("Caught an AmazonServiceException, which means your request made it "
                    + "to AWS, but was rejected with an error response for some reason.");
            System.out.println("Error Message:    " + ase.getMessage());
            System.out.println("HTTP Status Code: " + ase.getStatusCode());
            System.out.println("AWS Error Code:   " + ase.getErrorCode());
            System.out.println("Error Type:       " + ase.getErrorType());
            System.out.println("Request ID:       " + ase.getRequestId());
        } catch (AmazonClientException ace) {
            System.out.println("Caught an AmazonClientException, which means the client encountered "
                    + "a serious internal problem while trying to communicate with AWS, "
                    + "such as not being able to access the network.");
            System.out.println("Error Message: " + ace.getMessage());
        }
    }

    private static Map<String, AttributeValue> newItem(String Id, String rating, int Newstreams, String... fans) {
        Map<String, AttributeValue> item = new HashMap<String, AttributeValue>();
        item.put("Id", new AttributeValue(customerId));
        item.put("Newstreams", new AttributeValue().withS(Integer.toString(Newstreams)));
        item.put("CustomerEmail", new AttributeValue(rating));
        item.put("MemberName", new AttributeValue().withSS(fans));

        return item;
    }

    public static void uploadCustomer(String customerId, String customerName, String customerEmail, String product) throws Exception {

        init();
        try {

            Map<String, AttributeValue> item = new HashMap<String, AttributeValue>();
            item.put("Id", new AttributeValue(customerId));
            item.put("Newstreams", new AttributeValue().withS(product));
            item.put("CustomerEmail", new AttributeValue(customerEmail));
            item.put("MemberName", new AttributeValue().withSS(customerName));
            PutItemRequest itemRequest = new PutItemRequest().withTableName(tableName).withItem(item);
            dynamoDB.putItem(itemRequest);
            item.clear();
        } catch (AmazonServiceException ase) {
            System.err.println("Failed to create item in " + tableName + " " + ase);
        }

    }

    public static void addNewstream(String product, String custId) throws Exception {
        init();
        try {
            Map<String, AttributeValueUpdate> updateItems = new HashMap<String, AttributeValueUpdate>();
            HashMap<String, AttributeValue> expressionAttributeValues = new HashMap<String, AttributeValue>();
            expressionAttributeValues.put(":val1", new AttributeValue().withS(product));
            UpdateItemRequest updateItemRequest = new UpdateItemRequest();
//System.out.println("new value: " + result.toString());
        } catch (AmazonServiceException ase) {
            System.err.println("Failed to add item in " + tableName + " " + ase);
        }
    }

    public static String QueryCustomer(String customerId) throws Exception {
        String r = null;
        init();
        try {
            Condition hashKeyCondition = new Condition().withComparisonOperator(ComparisonOperator.EQ).withAttributeValueList(new AttributeValue().withS(customerId));
            Map<String, Condition> keyConditions = new HashMap<String, Condition>();
            keyConditions.put("Id", hashKeyCondition);
            QueryRequest queryRequest = new QueryRequest().withTableName("MemberData").withKeyConditions(keyConditions);
            System.out.println(customerId);
            QueryResult result = dynamoDB.query(queryRequest);

            for (Map<String, AttributeValue> item : result.getItems()) {
                r = result.toString();

            }
        } catch (AmazonServiceException ase) {
            System.err.println("Failed to find item in " + tableName + " " + ase);
        }
        return r;
    }

    private static void printItem(Map<String, AttributeValue> attributeList) {
        for (Map.Entry<String, AttributeValue> item : attributeList.entrySet()) {
            String attributeName = item.getKey();
            AttributeValue value = item.getValue();
            String itemString = (attributeName + " "
                    + (value.getS() == null ? "" : "S=[" + value.getS() + "]")
                    + (value.getS() == null ? "" : "S=[" + value.getS() + "]")
                    + (value.getS() == null ? "" : "S=[" + value.getS() + "]")
                    + (value.getS() == null ? "" : "S=[" + value.getS() + "]"));
            System.out.println(itemString);
        }
    }
}
