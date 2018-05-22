/*
 * @author Erin

Methods contain SQL Queries that are pre-written to be called on at any time to retrieve database info, without 
requiring the developer to write sql in the future or create multiple redundant connections to the host.
 */
package DataAccess;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Carley
 */
public class PropertyQueries {

    
    public PropertyQueries() {
        init();
    }

    private String host;
    private String uName;
    private String uPass;
private Statement stmt1;

    private void init() {
        this.host = "jdbc:derby://localhost:1527/formulate";
        this.uName = "me";
        this.uPass = "BellaBean0!";
        try {
            Connection con = DriverManager.getConnection(host, uName, uPass);
            this.stmt1 = con.createStatement();

        } catch (SQLException err) {
            System.out.println(err.getMessage() + "Problem with initiation ");
        }
    }
    // queries that return entire columsn of data
    public List getAllPropertyIDs() {
        List PIDList = new ArrayList();
        String query = "SELECT PROPERTYID FROM PROPERTIES";
        try {
            ResultSet result = stmt1.executeQuery(query);
            while (result.next()) {
                String PID = result.getString("PROPERTYID");
                PIDList.add(PID);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getAllPropertyIDs ");
        }
        return PIDList;
    }

    public List getAllAbbreviations() {
        List abbrevList = new ArrayList();
        String query = "SELECT ABBREVIATION FROM PROPERTIES";
        try {
            ResultSet result = stmt1.executeQuery(query);
            while (result.next()) {
                String abbrev = result.getString("ABBREVIATION");
                abbrevList.add(abbrev);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getAllAbbreviations ");
        }

        return abbrevList;
    }

    public List getAllNames() {
        List nameList = new ArrayList();
        String query = "SELECT NAME FROM PROPERTIES";
        try {
            ResultSet result = stmt1.executeQuery(query);
            while (result.next()) {
                String name = result.getString("NAME");
                nameList.add(name);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getAllNames ");
        }
        return nameList;
    }

    public List getAllSystems() {
        List systemList = new ArrayList();
        String query = "SELECT SYSTEM FROM PROPERTIES";
        try {
            ResultSet result = stmt1.executeQuery(query);
            while (result.next()) {
                String system = result.getString("SYSTEM");
                systemList.add(system);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getAllSystems ");
        }
        return systemList;
    }

    public List getAllClusters() {
        List clusterList = new ArrayList();
        String q = "SELECT CLUSTER FROM FORMULAS";
        try {
            ResultSet result = stmt1.executeQuery(q);
            while (result.next()) {
                String cluster = result.getString("CLUSTER");
                clusterList.add(cluster);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getAllClusters ");
        }
        return (clusterList);
    }

    public List getAllFormulas() {
        List formulaList = new ArrayList();
        String formula = "SELECT FORMULA FROM FORMULAS";
        try {
            ResultSet result = stmt1.executeQuery(formula);
            while (result.next()) {
                formula = result.getString("FORMULA");
                formulaList.add(formula);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getAllFormulas  ");
        }
        return (formulaList);
    }

    public List getAllFormulaIDs() {
        List FIDList = new ArrayList();
        String FID = "SELECT FORMULAID FROM FORMULAS";
        try {
            ResultSet Result = stmt1.executeQuery(FID);
            while (Result.next()) {
                FID = Result.getString("FORMULAID");
                FIDList.add(FID);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getAllFormulaIDs ");
        }
        return FIDList;
    }

    public List getAllDistinctClusters() {
        List distinctClustersList = new ArrayList();
        String distinctCluster = "SELECT DISTINCT CLUSTER FROM FORMULAS";
        try {
            ResultSet result = stmt1.executeQuery(distinctCluster);
            while (result.next()) {
                distinctCluster = result.getString("CLUSTER");
                distinctClustersList.add(distinctCluster);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getAllDisctinctClusters");
        }
        return (distinctClustersList);
    }

  
    
//Queries that get data via primary keys- FormulaID
    public String getClusterByFID(String FID) {
        FID = "\'" + FID + " \'";
        String q = "SELECT CLUSTER FROM FORMULAS WHERE FORMULAID= " + FID;
        List clusterList = new ArrayList();
        String cluster = null;
        try {
            ResultSet result = stmt1.executeQuery(q);
            while (result.next()) {
                cluster = result.getString("CLUSTER");
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getClusterByFID");
        }
        return cluster;
    }

    public String getPIDByFID(String FID) {
        String PID = null;
        FID = "\'" + FID + " \'";
        String q = "SELECT PROPERTYID FROM FORMULAS WHERE FORMULAID= " + FID;
        try {
            ResultSet result = stmt1.executeQuery(q);
            while (result.next()) {
                PID = result.getString("PROPERTYID");
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getPIDByFID ");
        }
        return PID;
    }

    public List getFormulaByFID(String FID) {
        List formulaList = new ArrayList();
        FID = "\'" + FID + " \'";
        String FormulaByFID = "SELECT FORMULA FROM FORMULAS WHERE FORMULAID= " + FID;
        try {
            ResultSet result = stmt1.executeQuery(FormulaByFID);
            while (result.next()) {
                String formula = result.getString("FORMULA");
                formulaList.add(formula);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getFormulaByFID ");
        }
        return formulaList;
    }

    public List setAllFormulaDataByFID(String ca) {
        List allByPIDList = new ArrayList();
        ca = "\'" + ca + " \'";
        String all = "SELECT PROPERTYID, FORMULAID, CLUSTER, FORMULA FROM FORMULAS WHERE FORMULA = " + ca;
        try {
            ResultSet result = stmt1.executeQuery(all);
            while (result.next()) {
                String PID = result.getString("PROPERTYID");
                String FID = result.getString("FORMULAID");
                String formula = result.getString("FORMULA");
                String cluster = result.getString("CLUSTER");

                allByPIDList.add(cluster);
                allByPIDList.add(FID);
                allByPIDList.add(formula);
                allByPIDList.add(PID);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " test collection  ");
        }
        return allByPIDList;
    }

    public List getFormulaDataByFID(String FID) {
        List allByFIDList = new ArrayList();
        FID = "\'" + FID + " \'";
        String all = "SELECT PROPERTYID,  CLUSTER, FORMULA FROM FORMULAS WHERE PROPERTYID = " + FID;
        try {
            ResultSet result = stmt1.executeQuery(all);
            while (result.next()) {
                String PID = result.getString("PROPERTYID");
                String cluster = result.getString("CLUSTER");
                String formula = result.getString("FORMULA");

                allByFIDList.add(PID);
                allByFIDList.add(cluster);
                allByFIDList.add(formula);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " test collection  ");
        }
        return allByFIDList;
    }

    
    
    
    
    //Queries that get data via primary keys- PropertyID
     public List setAllFormulaDataByPID(String ca) {
        List allByPIDList = new ArrayList();
        ca = "\'" + ca + " \'";
        String all = "SELECT PROPERTYID, FORMULAID, CLUSTER, FORMULA FROM FORMULAS WHERE PROPERTYID = " + ca;
        try {
            ResultSet result = stmt1.executeQuery(all);
            while (result.next()) {
                String PID = result.getString("PROPERTYID");
                String FID = result.getString("FORMULAID");
                String formula = result.getString("FORMULA");
                String cluster = result.getString("CLUSTER");

                allByPIDList.add(cluster);
                allByPIDList.add(FID);
                allByPIDList.add(formula);
                allByPIDList.add(PID);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " test collection  ");
        }
        return allByPIDList;
    }
     
    public List getFormulaByPID(String PID) {
        List formulaList = new ArrayList();
        PID = "\'" + PID + " \'";
        String FormulaByPID = "SELECT FORMULA FROM FORMULAS WHERE PROPERTYID= " + PID;
        try {
            ResultSet result = stmt1.executeQuery(FormulaByPID);
            while (result.next()) {
                String formula = result.getString("FORMULA");
                formulaList.add(formula);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getFormulaByPID ");
        }
        return formulaList;
    }

    public String getNameByPID(String PID) {
        PID = "\'" + PID + " \'";
        String q = "SELECT NAME FROM PROPERTIES WHERE PROPERTYID = " + PID;
        List nameByPIDList = new ArrayList();
        String name = null;
        try {
            ResultSet result = stmt1.executeQuery(q);
            while (result.next()) {
                name = result.getString("NAME");
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getNameBySystem ");
        }
        return name;
    }

    public List getClusterByPID(String PID) {
        PID = "\'" + PID + " \'";
        List clusterList = new ArrayList();
        String cluster;
        String clusterByPID = "SELECT CLUSTER FROM FORMULAS WHERE PROPERTYID= " + PID;
        try {
            ResultSet result = stmt1.executeQuery(clusterByPID);
            while (result.next()) {
                cluster = result.getString("CLUSTER");
                clusterList.add(cluster);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getClusterByPID ");
        }
        return clusterList;
    }

    public List getPropertyDataByPID(String PID) {
        List allByPIDList = new ArrayList();
        PID = "\'" + PID + " \'";
        String all = "SELECT NAME, ABBREVIATION, SYSTEM, DESCRIPTION FROM PROPERTIES WHERE PROPERTYID = " + PID;
        try {
            ResultSet result = stmt1.executeQuery(all);
            while (result.next()) {
                String name = result.getString("NAME");
                String abbrev = result.getString("ABBREVIATION");
                String description = result.getString("DESCRIPTION");

                allByPIDList.add(name);
                allByPIDList.add(abbrev);
                allByPIDList.add(description);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " test collection  ");
        }
        return allByPIDList;
    }

    public List getFIDByPID(String PID) {
        List FIDByPIDList = new ArrayList();
        PID = "\'" + PID + " \'";
        String FIDByPID = "SELECT FORMULAID FROM FORMULAS WHERE PROPERTYID=" + PID;
        try {
            ResultSet result = stmt1.executeQuery(FIDByPID);
            while (result.next()) {
                String FID = result.getString("FORMULAID");
                FIDByPIDList.add(FID);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getFIDByPID ");
        }
        return (FIDByPIDList);
    }

    public List getAbbrevByPID(String PID) {
        PID = "\'" + PID + " \'";
        List abbrevByPIDList = new ArrayList();
        try {
            ResultSet result = stmt1.executeQuery("SELECT ABBREVIATION FROM PROPERTIES WHERE PROPERTYID=" + PID);
            while (result.next()) {
                String abbrev = result.getString("ABBREVIATION");
                abbrevByPIDList.add(abbrev);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getAbbrevByPID ");
        }
        return (abbrevByPIDList);
    }
    
    
    
    
    
    
    
    //Queries that get data via other secondary fields
    public List getAbbrevBySystem(String system) {
        system = "\'" + system + " \'";
        String q = "SELECT ABBREVIATION FROM PROPERTIES WHERE SYSTEM=" + system;
        List abbrevList = new ArrayList();
        try {
            ResultSet result = stmt1.executeQuery(q);
            while (result.next()) {
                String abbrev = result.getString("ABBREVIATION");
                abbrevList.add(abbrev);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getAbbrevBySystem ");
        }
        return abbrevList;
    }

    public List getAbbrevByName(String Name) {
        List abbrevByNameList = new ArrayList();
        Name = "\'" + Name + " \'";
        try {
            ResultSet result = stmt1.executeQuery("SELECT ABBREVIATION FROM PROPERTIES WHERE NAME= " + Name);
            while (result.next()) {
                String abbrev = result.getString("ABBREVIATION");
                abbrevByNameList.add(abbrev);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getAbbrevByName ");
        }
        return (abbrevByNameList);
    }

    public List getNameByAbbrev(String Abbrev) {
        List nameByAbbrevList = new ArrayList();
        Abbrev = "\'" + Abbrev + " \'";
        String name = "SELECT NAME FROM PROPERTIES WHERE ABBREVIATION = " + Abbrev;
        try {
            ResultSet result = stmt1.executeQuery(name);
            while (result.next()) {
                name = result.getString("NAME");
                nameByAbbrevList.add(name);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getNameByAbbrev ");
        }
        return nameByAbbrevList;
    }

    public List getNameBySystem(String system) {
        system = "\'" + system + " \'";
        String q = "SELECT NAME FROM PROPERTIES WHERE SYSTEM = " + system;
        List nameBySystemList = new ArrayList();
        try {
            ResultSet result = stmt1.executeQuery(q);
            while (result.next()) {
                String name = result.getString("NAME");
                nameBySystemList.add(name);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getNameBySystem ");
        }
        return nameBySystemList;
    }

    public List getPIDByCluster(String c) {
        c = "\'" + c + "\'";
        String q = "SELECT PROPERTYID FROM FORMULAS WHERE CLUSTER= " + c;
        List PIDByClusterList = new ArrayList();
        try {
            ResultSet result = stmt1.executeQuery(q);
            while (result.next()) {
                String PID = result.getString("PROPERTYID");
                PIDByClusterList.add(PID);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getPIDByCluster ");
        }
        return PIDByClusterList;
    }

    public List getPIDByFormula(String formula) {
        formula = "\'" + formula + " \'";
        List PIDByFormulaList = new ArrayList();
        String PIDByFormula = "SELECT PROPERTYID FROM FORMULAS WHERE FORMULA= " + formula;
        try {
            ResultSet result = stmt1.executeQuery(PIDByFormula);
            while (result.next()) {
                String PID = result.getString("PROPERTYID");
                PIDByFormulaList.add(PID);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getPIDByFormula");
        }
        return (PIDByFormulaList);
    }

    public List getPIDBySystem(String system) {
        List PIDBySystemList = new ArrayList();
        system = "\'" + system + " \'";
        String PIDBySystem = "SELECT PROPERTYID FROM PROPERTIES WHERE SYSTEM= " + system;
        try {
            ResultSet result = stmt1.executeQuery(PIDBySystem);
            while (result.next()) {
                String PID = result.getString("PROPERTYID");
                PIDBySystemList.add(PID);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getPIDBySystem  ");
        }
        return (PIDBySystemList);
    }

    public List getPIDByName(String name) {
        name = "\'" + name + " \'";
        String PIDByName = "SELECT PROPERTYID FROM PROPERTIES WHERE NAME= " + name;
        List PIDList = new ArrayList();
        try {
            ResultSet result = stmt1.executeQuery(PIDByName);
            while (result.next()) {
                String PID = result.getString("PROPERTYID");
                PIDList.add(PID);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.PIDByName  ");
        }
        return PIDList;
    }

    public List getPIDByAbbrev(String abbrev) {
        List PIDByAbbrevList = new ArrayList();
        abbrev = "\'" + abbrev + " \'";
        String PIDByAbbrev = "SELECT PROPERTYID FROM PROPERTIES WHERE ABBREVIATION= " + abbrev;
        try {
            ResultSet result = stmt1.executeQuery(PIDByAbbrev);
            while (result.next()) {
                String PID = result.getString("PROPERTYID");
                PIDByAbbrevList.add(PID);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getPIDByAbbrev");
        }
        return (PIDByAbbrevList);
    }

    public List getDescriptionByPID(String PID) {
        List DescriptionByPIDList = new ArrayList();
        PID = "\'" + PID + " \'";
        String DescriptionByPID = "SELECT DESCRIPTION FROM PROPERTIES WHERE PROPERTYID= " + PID;
        try {
            ResultSet result = stmt1.executeQuery(DescriptionByPID);
            while (result.next()) {
                String description = result.getString("DESCRIPTION");
                DescriptionByPIDList.add(description);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getDescriptions by PID");
        }
        return (DescriptionByPIDList);
    }

    public List getFIDByCluster(int cluster) {
        List FIDByClusterList = new ArrayList();
        String FIDByCluster = "SELECT FORMULAID FROM FORMULAS WHERE CLUSTER=" + cluster;
        try {
            ResultSet result = stmt1.executeQuery(FIDByCluster);
            while (result.next()) {
                String FID = result.getString("FORMULAID");
                FIDByClusterList.add(FID);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getFIDByCluster ");
        }
        return (FIDByClusterList);
    }

    public List getFormulasByCluster(int cluster) {
        List formulaByClusterList = new ArrayList();
        String formulaByCluster = "SELECT FORMULA FROM FORMULAS WHERE CLUSTER=" + cluster;
        try {
            ResultSet result = stmt1.executeQuery(formulaByCluster);
            while (result.next()) {
                String formula = result.getString("FORMULA");
                formulaByClusterList.add(formula);
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getFormulasByCluster ");
        }
        return (formulaByClusterList);
    }

    public int getClusterNumber(String cluster) {
        List ClusterList = new ArrayList();
        String Cluster = "SELECT CLUSTER FROM FORMULAS";
        try {
            ResultSet result = stmt1.executeQuery(Cluster);
            while (result.next()) {
                ClusterList.add(result.next());
            }
        } catch (SQLException err) {
            System.out.println(err.getMessage() + " PropertyQueries.getClusterNumber    ");
        }
        return ClusterList.size();
    }
}
