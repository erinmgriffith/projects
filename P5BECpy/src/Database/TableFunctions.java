/*
 * To change this license header, choose License Headers in Project Properties.
 * Based off of APS Sample codes
 * and open the template in the editor.
 */
package Database;

import static Database.DatabaseExample.dynamoDB;
import com.amazonaws.AmazonClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import java.util.ArrayList;

import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.model.AttributeDefinition;
import com.amazonaws.services.dynamodbv2.model.CreateTableRequest;
import com.amazonaws.services.dynamodbv2.model.DeleteTableRequest;
import com.amazonaws.services.dynamodbv2.model.DeleteTableResult;
import com.amazonaws.services.dynamodbv2.model.DescribeTableRequest;
import com.amazonaws.services.dynamodbv2.model.KeySchemaElement;
import com.amazonaws.services.dynamodbv2.model.KeyType;
import com.amazonaws.services.dynamodbv2.model.ListTablesRequest;
import com.amazonaws.services.dynamodbv2.model.ListTablesResult;
import com.amazonaws.services.dynamodbv2.model.ProvisionedThroughput;
import com.amazonaws.services.dynamodbv2.model.ResourceNotFoundException;
import com.amazonaws.services.dynamodbv2.model.TableDescription;
import com.amazonaws.services.dynamodbv2.model.TableStatus;
import com.amazonaws.services.dynamodbv2.model.UpdateTableRequest;
import com.amazonaws.services.dynamodbv2.model.UpdateTableResult;

public class TableFunctions {
static String tablename= "MemberData";
static String attributeKey="Id" ;
    static AmazonDynamoDBClient dynamoDB;

  
  public TableFunctions(String TableName, String AttributeName1) {
    tablename=TableName;
    attributeKey=AttributeName1;
    
  }

  
  

  public static void main(String[] args) throws Exception {
    createClient();
createTable();
  listMyTables();
//   getTableInformation();
//    updateTableInformation();



  }

  // ************************ Creates a new table, empty list of attributes, and list of keys type "S" 
// Read write capacity is set at 5 temporarily because i am not sure of the best value to set these at  ***********************
 public static void createTable() {
    ProvisionedThroughput provisionedThroughput = new ProvisionedThroughput().withReadCapacityUnits(5L).withWriteCapacityUnits(5L);
    CreateTableRequest request = new CreateTableRequest().withTableName(tablename).withProvisionedThroughput(provisionedThroughput);
    
        ArrayList<AttributeDefinition> attributeDefinitions = new ArrayList<AttributeDefinition>();// --------creates empty list of attributes ------
          attributeDefinitions.add(new AttributeDefinition().withAttributeName(attributeKey).withAttributeType("S"));
          request.setAttributeDefinitions(attributeDefinitions);

        ArrayList<KeySchemaElement> tableKeySchema = new ArrayList<KeySchemaElement>();// --------creates empty list of keys ------
            tableKeySchema.add(new KeySchemaElement().withAttributeName(attributeKey).withKeyType(KeyType.HASH));
            request.setKeySchema(tableKeySchema);
    
            dynamoDB.createTable(request);
    waitForTableToBecomeAvailable(tablename);
    getTableInformation();
  }

    private static void createClient() throws Exception {
       BasicAWSCredentials cred = new  BasicAWSCredentials('removed for security'");
         AWSCredentials credentials = null;
        try {
            credentials = new ProfileCredentialsProvider().getCredentials();
        } catch (Exception e) {
            throw new AmazonClientException(
                    "Cannot load the credentials from the credential profiles file. " +
                    "Please make sure that your credentials file is at the correct " +
                    "location (~/.aws/credentials), and is in valid format.",
                    e);
        }
        dynamoDB = new AmazonDynamoDBClient(cred);
        Region usWest2 = Region.getRegion(Regions.US_WEST_2);
        dynamoDB.setRegion(usWest2);
//               dynamoDB.setEndpoint("http://localhost:8000");
    }
  // ************************ retrieves and prints the names of all tables ***********************
 public static String listMyTables() {
    ArrayList nameList= new ArrayList();
    String lastEvaluatedTableName = null;
    do {
      ListTablesRequest listTablesRequest = new ListTablesRequest()
              .withLimit(10)
              .withExclusiveStartTableName(lastEvaluatedTableName);
      ListTablesResult result = dynamoDB.listTables(listTablesRequest);
      lastEvaluatedTableName = result.getLastEvaluatedTableName();
      for (String name : result.getTableNames()) {
        System.out.println(name);
       nameList.add(name);
      }
    } while (lastEvaluatedTableName != null);
    return nameList.toString();
  }

  
  
  // ************************ prints out the description of the table and its provisioned throughput in a formatted string ***********************
   public  static void getTableInformation() {
    TableDescription tableDescription = dynamoDB.describeTable(
            new DescribeTableRequest().withTableName(tablename)).getTable();
    System.out.format("Name: %s:\n"   + "Status: %s \n" + "Provisioned Throughput (read capacity units/sec): %d \n" + "Provisioned Throughput (write capacity units/sec): %d \n",
            tableDescription.getTableName(), tableDescription.getTableStatus(),  tableDescription.getProvisionedThroughput().getReadCapacityUnits(), tableDescription.getProvisionedThroughput().getWriteCapacityUnits());
  }

  
  
  // ************************ updates a specified tables description and provisioned throughput ***********************
   public  static void updateTableInformation() {
    ProvisionedThroughput provisionedThroughput = new ProvisionedThroughput() .withReadCapacityUnits(6L).withWriteCapacityUnits(7L);
    UpdateTableRequest updateTableRequest = new UpdateTableRequest().withTableName(tablename).withProvisionedThroughput(provisionedThroughput);
    UpdateTableResult result = dynamoDB.updateTable(updateTableRequest);
    waitForTableToBecomeAvailable(tablename);
  }

  
  
 // ************************ deletes table ***********************
   public  static void deleteTable(String delTableName) {
    DeleteTableRequest deleteTableRequest = new DeleteTableRequest() .withTableName(delTableName);
    DeleteTableResult result = dynamoDB.deleteTable(deleteTableRequest);
    waitForTableToBeDeleted(delTableName);
  }

  
  // ************************ controls threads during wait and prints status of activation***********************
   public  static void waitForTableToBecomeAvailable(String tableName) {
    System.out.println("Waiting for " + tableName + " to become ACTIVE...");
    long startTime = System.currentTimeMillis();
    long endTime = startTime + (10 * 60 * 1000);
    while (System.currentTimeMillis() < endTime) {
      DescribeTableRequest request = new DescribeTableRequest()  .withTableName(tableName);
      TableDescription tableDescription = dynamoDB.describeTable( request).getTable();
      String tableStatus = tableDescription.getTableStatus();
      System.out.println("  - current state: " + tableStatus);
      if (tableStatus.equals(TableStatus.ACTIVE.toString())) {
        return;
      }
      try {
        Thread.sleep(1000 * 20);
      } catch (Exception e) {
      }
    }
    throw new RuntimeException("Table " + tableName + " never went active");
  }

  
    // ************************ controls threads during wait and prints out status of deletion ***********************
 public static void waitForTableToBeDeleted(String tableName) {
    System.out.println("Waiting for " + tableName + " while status DELETING...");
    long startTime = System.currentTimeMillis();
    long endTime = startTime + (10 * 60 * 1000);
    while (System.currentTimeMillis() < endTime) {
      try {
        DescribeTableRequest request = new DescribeTableRequest().withTableName(tableName);
        TableDescription tableDescription = dynamoDB.describeTable(request).getTable();
        String tableStatus = tableDescription.getTableStatus();
        System.out.println("  - current state: " + tableStatus);
        if (tableStatus.equals(TableStatus.ACTIVE.toString())) {
          return;
        }
      } catch (ResourceNotFoundException e) {
        System.out.println("Table " + tableName + " is not found. It was deleted.");
        return;
      }
      try {
        Thread.sleep(1000 * 20);
      } catch (Exception e) {
      }
    }
    throw new RuntimeException("Table " + tableName + " was never deleted");
  }

}
