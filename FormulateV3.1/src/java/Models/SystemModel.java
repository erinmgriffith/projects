/**
 *
 * @author Erin
 */
/*
System model creates arrays of property, formula, and relation objects and populates them
with instances created from data retrieved in sql class
 */

package Models;
import DataAccess.*;
import java.util.*;

public class SystemModel {

    
    public SystemModel() {
    }
    PropertyQueries q = new PropertyQueries();
    List formulaList = new ArrayList();
    List FIDList = new ArrayList();
    List PIDList = new ArrayList();
    int c = 0;
    int dataFieldsInRelation = 3;
    int propertyAmount = q.getAllFormulaIDs().size();
    int systemSize = q.getAllFormulaIDs().size();
    int numberOfRelations = this.getNumberOfRelations();
    propertyData myPropertyData = new propertyData();
    formulaData myFormulaData = new formulaData();
    relationData myRelationData = new relationData();

    
    
    //gets the total number of current relations (same as # of permutations of all formulas combined)
    public int getNumberOfRelations() {
        int relationNumber = 0;
        List distinctClusterList = new ArrayList();
        distinctClusterList.addAll(q.getAllDistinctClusters());
        int distinctClusterNumber = distinctClusterList.size();
        for (int i = 0; i < distinctClusterNumber; i++) {
            relationNumber += distinctClusterNumber * q.getClusterNumber(distinctClusterList.get(i).toString());
        }
        return relationNumber;
    }

    public formulaData getMyFormulaData() {
        return myFormulaData;
    }

    public propertyData getMyPropertyData() {
        return myPropertyData;
    }
    public relationData getMyRelationData() {
        return myRelationData;
    }

    // returns array of property classes as created in nested Property data class
    public Property[] getPropertyData() {
        propertyData myData = new propertyData();
        return myData.getPropertyArray();
    }

        // returns array of formula classes as created in nested formula data class
    public Formula[] getFormulaData() {
        formulaData myData = new formulaData();
        {
            return myData.getFormulaArray();
        }
    }
        // returns array of relation classes as created in nested relation data class
    public Relation[] getRelationData() {
        relationData myData = new relationData();
        return myData.getRelationArray();
    }

       
    // creates an array of Relation objects
    protected class relationData {
        relationData() {
        }
        Relation[] relationData = new Relation[88];  // in a better world size would be determined with FID # * size of each cluster -1
        List to = new ArrayList();
        List PIDinCluster = new ArrayList();
        int counter = 0;

        
        
        //gets all formula ids and all property ids associated with each individual formula. Iterates through each of the formula's 
        //property ids and pairs with another property id that is also associated with a particular formula.
        public void formRelations() {
            List allFID = new ArrayList();
            allFID.addAll(q.getAllFormulaIDs());
            Iterator FIDiT = allFID.iterator();

            for (int j = 0; j < allFID.size(); j++) {
                String FID = FIDiT.next().toString();
                String cluster = q.getClusterByFID(FID);
                String formula = q.getFormulaByFID(FID).toString();
                String from = q.getPIDByFID(FID);
// As "to" property is paired with "from" property it is removed from list of available "to" properties. When list is empty
// outer loop repeats and process starts again with new to and from lists from the next formula cluster
                to.addAll(q.getPIDByCluster(cluster));
                while (to.contains(from)) {
                    to.remove(from);
                }
                // iterates through the current "to" list and matches with "from" value
                for (int i = 0; i < to.size(); i++) {
                    relationData[counter] = new Relation(counter, cluster, formula, from, to.get(i).toString());
                    counter++;
                }
                to.clear();
            }
        }

        //used to fetch relation data from external classes
        public Relation[] getRelationArray() {
            formRelations();
            return relationData;
        }
    }

        // creates and populates an array of Property objects
    protected class propertyData {
        propertyData() {
        }
                
        PropertyQueries y = SystemModel.this.q;
        List ids = y.getAllPropertyIDs();
        int numOfProperties = ids.size();
        Property[] propertyData = new Property[numOfProperties];

        
        //returns array of property objects to external classes
        public Property[] getPropertyArray() {
            makeProperties();
            return propertyData;
        }
        // returns specific index of array object
        public Property getProperty(int Index) {
            return propertyData[Index];
        }
        //gets property data from query class and instantiates property objects
        public void makeProperties() {
            String name;
            String abbreviation;
            String system;
            String ID;
            String description;
            for (int i = 0; i < numOfProperties; i++) {
                name = y.getNameByPID(ids.get(i).toString()).toString();
                abbreviation = y.getAbbrevByPID(ids.get(i).toString()).toString();
                system = "Mech";
                ID = ids.get(i).toString();
                description = y.getDescriptionByPID(ids.get(i).toString()).toString();
                propertyData[i] = new Property(name, abbreviation, system, ID, description);
            }
        }
    }
     
            // creates and populates an array of Formula objects
    protected class formulaData {
        formulaData() {
        }
        
        PropertyQueries y = SystemModel.this.q;
        List ids = y.getAllFormulaIDs();
        int numOfFormulas = ids.size();
        Formula[] formulaData = new Formula[numOfFormulas];

        //returns array of formula objects to external classes
        public Formula[] getFormulaArray() {
            makeFormulas();
            return formulaData;
        }
        //returns specific formula object 
        public Formula getFormula(int Index) {
            return formulaData[Index];
        }
        //gets formula data from query class and instantiates Formula objects
        public void makeFormulas() {
            String FID;
            String PID;
            String cluster;
            String formula;
            for (int i = 0; i < numOfFormulas; i++) {
                formula = y.getFormulaByFID(ids.get(i).toString()).toString();
                PID = y.getPIDByFID(ids.get(i).toString()).toString();
                cluster = y.getClusterByFID(ids.get(i).toString()).toString();
                FID = ids.get(i).toString();
                formulaData[i] = new Formula(cluster, formula, PID, FID);
            }
        }
    }
}
  