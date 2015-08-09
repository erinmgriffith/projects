package Database;
//the code in this file is incomplete
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.ArrayList;
//import com.amazonaws.codesamples.ManipulateItems;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBAttribute;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBHashKey;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBMapper;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBMapperConfig;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBTable;

public class ManipulateItems {
    
    static AmazonDynamoDBClient client = new AmazonDynamoDBClient(new ProfileCredentialsProvider());
        
    public static void main(String[] args) throws IOException {
            client.setEndpoint("http://localhost:8000");
//     newMember(getId, getName, GetEmail, getNewstreams);  
        System.out.println("Example complete!");
    }

    @DynamoDBTable(tableName="MemberData")
    public static class Member {
        private String Id;
        private String name;
        private String email;
        private Set<String> newstreams;
         
        @DynamoDBHashKey(attributeName="Id")
        public String getId() { return Id; }
        public void setId(String Id) { this.Id = Id; }
        
        @DynamoDBAttribute(attributeName="name")
        public String getName() { return name; }    
        public void setName(String name) { this.name = name; }
        
        @DynamoDBAttribute(attributeName="email")
        public String getEmail() { return email; }    
        public void setEmail(String email) { this.email = email;}
        
        @DynamoDBAttribute(attributeName = "newstreams")
        public Set<String> getNewstreams() { return newstreams; }    
        public void setNewstreams(Set<String> newstreams) { this.newstreams = newstreams; }
        
           
        @Override
        public String toString() {
            return "Member[email=" + email + ", newstreams=" + newstreams
            + ", id=" + Id + ", name=" + name + "]";            
        }
    }
        
    private static void newMember(String id, String Name, String email, String Newstream) {
        Member member = new Member();
        member.setId(" 321");
        member.setName("CName");
        member.setEmail("this.isEmail.com");
        member.setNewstreams(new HashSet<String>(Arrays.asList("Newstream 1")));

        // Save the member (book).
        DynamoDBMapper mapper = new DynamoDBMapper(client);
        mapper.save(member);
        
        // Retrieve the member.
      
        Member memberRetrieved = mapper.load(Member.class, " 123");
        System.out.println("Item retrieved:");
        System.out.println(memberRetrieved);

        // Update the member.

      memberRetrieved.getNewstreams().add("Nesw 2");

        mapper.save(memberRetrieved);
        System.out.println("Item updated:");
        System.out.println(memberRetrieved);

        // Retrieve the updated member.
        DynamoDBMapperConfig config = new DynamoDBMapperConfig(DynamoDBMapperConfig.ConsistentReads.CONSISTENT);
        Member updatedItem = mapper.load(Member.class, " 123", config);
        System.out.println("Retrieved the previously updated member:");
        System.out.println(updatedItem);

        // Delete the member.
       

        // Try to retrieve deleted member.
//        Member deletedItem = mapper.load(Member.class, updatedItem.getId(), config);
//        if (deletedItem == null) {
//            System.out.println("Done - Sample member is deleted.");
//        }
    }
   
    private static void addNewstream(){
      
    }
    
    private static void deleteMember(){
      
    }
    
    private static void deleteNewstream(){
      
    }
}

          