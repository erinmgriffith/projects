package Database;

import static Database.CustomerData.dynamoDB;
import static Database.QueryFunctions.dateFormatter;
import com.amazonaws.AmazonClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.policy.actions.RDSActions;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
//import com.amazonaws.codesamples.ManipulateMemberData;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBAttribute;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBHashKey;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBMapper;
import com.amazonaws.services.dynamodbv2.datamodeling.PaginatedQueryList;
import com.amazonaws.services.dynamodbv2.datamodeling.JsonMarshaller;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBMapperConfig;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBQueryExpression;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBScanExpression;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBTable;
import com.amazonaws.services.dynamodbv2.model.AttributeValue;
import com.amazonaws.services.dynamodbv2.model.ComparisonOperator;
import com.amazonaws.services.dynamodbv2.model.Condition;
import com.amazonservices.mws.offamazonpayments.OffAmazonPaymentsServiceClient;
import com.amazonservices.mws.offamazonpayments.OffAmazonPaymentsServiceConfig;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberData extends HttpServlet {

  static AmazonDynamoDBClient client = new AmazonDynamoDBClient(new ProfileCredentialsProvider());
  protected OffAmazonPaymentsServiceConfig config;
  protected OffAmazonPaymentsServiceClient paymentsServiceClient;
//  private static String custId = "testing";
//  private static String custName ="myName";
//  private static String custEmail = "myemail";
// static String ProductId= "A jacket";
   private static  String custId;
  private static String custName ;
  private  static String custEmail ;
 static String ProductId;
 static int routine ;
      static  DynamoDBMapper mapper = new DynamoDBMapper(dynamoDB);





  /**
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
//          Routine = routine;
          throws ServletException, IOException {
  custId = request.getParameter("CustomerId");
custName = request.getParameter("CustomerName");
custEmail = request.getParameter("CustomerEmail") ;
ProductId= request.getParameter("ProductId");

  }

  public static void main(String[] args) throws IOException {

    AWSCredentials credentials = null;
    try {
      credentials = new ProfileCredentialsProvider().getCredentials();
     run(2, "21_43_75", "product", "Name", "Email"  );
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

  public static void run(int Routine, String Id, String Product, String Name, String Email ) throws Exception {
    boolean purchase = true;
    custId = Id;
    custName = Name;
    custEmail = Email;
    routine=Routine;
    ProductId=Product;
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

    try {

//      init();
    } catch (Exception e) {
      System.err.println("Error running query " + e);
      e.printStackTrace();
    }

    try {

      DynamoDBMapper mapper = new DynamoDBMapper(dynamoDB);

      switch (Routine) {
        case 1:
          System.out.println("case 1");
          if (!findMember(mapper, custId)) {
            System.out.println("Member  is not currently in our database. Member information will now be added");
            addMember(mapper, custId);
            System.out.println("Added member " + custId + "\n.");
          } else if (findMember(mapper, custId)) {
            System.out.println("Customer " + custId + " is in our records.");
          }
          break;
        case 2:
          System.out.println("case 2 : verify purchase");
             if ( findNewstream(mapper, custId, ProductId)){
               System.out.println("access is validated");
             } else { 
               System.out.println("nope");
             };
          break;
        case 3:
          System.out.println("case 3");
          System.out.println("now adding newstream: " + ProductId);
          addNewstreams( custId, ProductId);
          findNewstream( mapper, custId, custName);
          break;
        case 4:
          System.out.println("case 4");
          System.out.println("Customer has access to the following Newstreams: ")  ;
          listNewstreams(custId);
          break;
        case 5:
          System.out.println("case 5");
          break;
        default:
          System.out.println(" Not a routine");
      }


    } catch (Exception e) {
    }
  }

  @DynamoDBTable(tableName = "MemberData")
  public static class Member {

    private String Id;
    private String name;
    private String email;
    private Set<String> newstreams;

    @DynamoDBHashKey(attributeName = "Id")
    public String getId() {
      return Id;
    }

    public void setId(String Id) {
      this.Id = Id;
    }

    @DynamoDBAttribute(attributeName = "name")
    public String getName() {
      return name;
    }

    public void setName(String name) {
      this.name = name;
    }

    @DynamoDBAttribute(attributeName = "email")
    public String getEmail() {
      return email;
    }

    public void setEmail(String email) {
      this.email = email;
    }

    @DynamoDBAttribute(attributeName = "newstreams")
    public Set<String> getNewstreams() {
      return newstreams;
    }

//    @DynamoDBAttribute(attributeName = "newstream")
//    public String getNewstreams() {
//      return newstreams;
//    }
    public void setNewstreams(Set<String> newstreams) {
      this.newstreams = newstreams;
    }

    @Override
    public String toString() {
      return "Member[email=" + email + ", newstreams=" + newstreams
              + ", id=" + Id + ", name=" + name + "]";
    }
  }

  public static boolean findMember(DynamoDBMapper mapper, String Id) throws Exception {
    String hashKey = Id;
    Condition condition = new Condition().withComparisonOperator(ComparisonOperator.EQ.toString()).withAttributeValueList(new AttributeValue().withS(Id));
    Member memberKey = new Member();
    memberKey.setId(hashKey);
    DynamoDBQueryExpression<Member> queryExpression = new DynamoDBQueryExpression<Member>().withHashKeyValues(memberKey);

    List<Member> result = mapper.query(Member.class, queryExpression);
    for (Member isMember : result) {
      System.out.printf("Id=%s%n", isMember.getId());
      return true;
    }
    return false;
  }

  public static boolean findNewstream(DynamoDBMapper mapper, String Id, String ProductId) {

    System.out.println("Find specific newstreams.");
//     DynamoDBMapper mapper = new DynamoDBMapper(dynamoDB);
    DynamoDBScanExpression expression = new DynamoDBScanExpression();

    expression.addFilterCondition("Id",
            new Condition()
            .withComparisonOperator(ComparisonOperator.CONTAINS)
            .withAttributeValueList(new AttributeValue().withS(Id)));
    expression.addFilterCondition("newstreams",
            new Condition()
            .withComparisonOperator(ComparisonOperator.CONTAINS)
            .withAttributeValueList(new AttributeValue().withS(ProductId)));
    List<Member> scanResult;
//    scanResult= mapper.parallelScan(Member.class, expression, 6);
       scanResult= mapper.scan(Member.class, expression);
    for (Member bicycle : scanResult) {
      System.out.println(bicycle);
      return true;
    }
    return false;
  }

  public static void addMember(DynamoDBMapper mapper, String Id) {
    DynamoDBMapper addMapper = new DynamoDBMapper(dynamoDB);
    Member member = new Member();
    member.setId(Id);
    member.setName("another");
    member.setEmail("erin@theMail.com");
    member.setNewstreams(new HashSet<String>(Arrays.asList("Newstream 1")));
    mapper.save(member);
    Member memberReturned = mapper.load(member);
    System.out.println(" new member added: ");
    System.out.println(memberReturned);

  }


static void addNewstreams(String Id, String Newstream) {
    DynamoDBMapper mapper = new DynamoDBMapper(dynamoDB);
    DynamoDBMapperConfig config = new DynamoDBMapperConfig(DynamoDBMapperConfig.ConsistentReads.CONSISTENT);
    Member updatedItem = mapper.load(Member.class, Id, config);
    updatedItem.getNewstreams().add(Newstream);
    mapper.save(updatedItem);
    System.out.println(updatedItem);
  }
  

  static void listNewstreams(String Id) {
    DynamoDBMapper mapper = new DynamoDBMapper(dynamoDB);
    DynamoDBMapperConfig config = new DynamoDBMapperConfig(DynamoDBMapperConfig.ConsistentReads.CONSISTENT);
    Member memberHas = mapper.load(Member.class, Id, config);
 String listing =("Member" + custId + " has purchased the following newstreams: " + memberHas.getNewstreams().toString());
 System.out.println(listing);
  }

}
