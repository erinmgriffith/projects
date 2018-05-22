/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import java.util.*;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author eringriffith
 */
public class PropertyQueriesTest {
  static  List  allPropertyIDs=new ArrayList();

  static  List allAbbreviations=new ArrayList();
   static List allNames=new ArrayList();

    public PropertyQueriesTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
        allPropertyIDs.add("Mech_F");
        allPropertyIDs.add("Mech_a");
        allPropertyIDs.add("Mech_h");
        allPropertyIDs.add("Mech_J");
        allPropertyIDs.add("Mech_w");
        allPropertyIDs.add("Mech_K");
        allPropertyIDs.add("Mech_l");
        allPropertyIDs.add("Mech_m");
        allPropertyIDs.add("Mech_N");
        allPropertyIDs.add("Mech_p");
        allPropertyIDs.add("Mech_P");
        allPropertyIDs.add("Mech_r");
        allPropertyIDs.add("Mech_T");
        allPropertyIDs.add("Mech_U");
        allPropertyIDs.add("Mech_v");
        allPropertyIDs.add("Mech_W");
        allPropertyIDs.add("Mech_x");
        allPropertyIDs.add("Mech_ø");
        allPropertyIDs.add("Mech_∫");
        allPropertyIDs.add("Mech_f");
        
        allAbbreviations.add("F");
        allAbbreviations.add("a");
        allAbbreviations.add("h");
        allAbbreviations.add("J");
        allAbbreviations.add("w");
        allAbbreviations.add("K");
        allAbbreviations.add("l");
        allAbbreviations.add("m");
        allAbbreviations.add("N");
        allAbbreviations.add("P");
        allAbbreviations.add("p");
        allAbbreviations.add("r");
        allAbbreviations.add("T");
        allAbbreviations.add("t");
        allAbbreviations.add("U");
        allAbbreviations.add("v");
        allAbbreviations.add("W");
        allAbbreviations.add("x");
        allAbbreviations.add("ø");
        allAbbreviations.add("∫");
        allAbbreviations.add("f");

        allNames.add("Force(Net)");
        allNames.add("Acceleration");
        allNames.add("Height");
        allNames.add("Impulse");
        allNames.add("Width");
        allNames.add("Kinetic Energy");
        allNames.add("Length");
        allNames.add("Mass");
        allNames.add("Normal Force");
        allNames.add("Power");
        allNames.add("Momentum");
        allNames.add("Radius");
        allNames.add("Period");
        allNames.add("Time");
        allNames.add("Potential Energy");
        allNames.add("Velocity");
        allNames.add("Work");
        allNames.add("Position");
        allNames.add("Angle");
        allNames.add("Torque");
        allNames.add("Frequency");                                                                                         
    }
 
 @Before
    public void setUp() {
      setUpClass();
    }


    
    
    @AfterClass
    public static void tearDownClass() {
    }
    
   
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getAllPropertyIDs method, of class PropertyQueries.
     */
    @Test
    public void testGetAllPropertyIDs() {
        System.out.println("getAllPropertyIDs");
        PropertyQueries instance = new PropertyQueries();
       this.setUp();
        List expResult = allPropertyIDs;
        List result = instance.getAllPropertyIDs();
        assertEquals(expResult, result);
    }

    /**
     * Test of getAllAbbreviations method, of class PropertyQueries.
     */
    @Test
    public void testGetAllAbbreviations() {
        System.out.println("getAllAbbreviations");
        PropertyQueries instance = new PropertyQueries();
        List expResult = allAbbreviations;
        List result = instance.getAllAbbreviations();
        assertEquals(expResult, result);
    }

    /**
     * Test of getAllNames method, of class PropertyQueries.
     */
    @Test
    public void testGetAllNames() {
        System.out.println("getAllNames");
        PropertyQueries instance = new PropertyQueries();
        List expResult = allNames;
        List result = instance.getAllNames();
        assertEquals(expResult, result);
    }

    /**
     * Test of getAllSystems method, of class PropertyQueries.
     */
    @Test
    public void testGetAllSystems() {
        System.out.println("getAllSystems");
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getAllSystems();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllClusters method, of class PropertyQueries.
     */
    @Test
    public void testGetAllClusters() {
        System.out.println("getAllClusters");
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getAllClusters();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllFormulas method, of class PropertyQueries.
     */
    @Test
    public void testGetAllFormulas() {
        System.out.println("getAllFormulas");
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getAllFormulas();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllFormulaIDs method, of class PropertyQueries.
     */
    @Test
    public void testGetAllFormulaIDs() {
        System.out.println("getAllFormulaIDs");
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getAllFormulaIDs();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllDistinctClusters method, of class PropertyQueries.
     */
    @Test
    public void testGetAllDistinctClusters() {
        System.out.println("getAllDistinctClusters");
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getAllDistinctClusters();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getClusterByFID method, of class PropertyQueries.
     */
    @Test
    public void testGetClusterByFID() {
        System.out.println("getClusterByFID");
        String FID = "";
        PropertyQueries instance = new PropertyQueries();
        String expResult = "";
        String result = instance.getClusterByFID(FID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPIDByFID method, of class PropertyQueries.
     */
    @Test
    public void testGetPIDByFID() {
        System.out.println("getPIDByFID");
        String FID = "";
        PropertyQueries instance = new PropertyQueries();
        String expResult = "";
        String result = instance.getPIDByFID(FID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getFormulaByFID method, of class PropertyQueries.
     */
    @Test
    public void testGetFormulaByFID() {
        System.out.println("getFormulaByFID");
        String FID = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getFormulaByFID(FID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setAllFormulaDataByFID method, of class PropertyQueries.
     */
    @Test
    public void testSetAllFormulaDataByFID() {
        System.out.println("setAllFormulaDataByFID");
        String ca = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.setAllFormulaDataByFID(ca);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getFormulaDataByFID method, of class PropertyQueries.
     */
    @Test
    public void testGetFormulaDataByFID() {
        System.out.println("getFormulaDataByFID");
        String FID = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getFormulaDataByFID(FID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setAllFormulaDataByPID method, of class PropertyQueries.
     */
    @Test
    public void testSetAllFormulaDataByPID() {
        System.out.println("setAllFormulaDataByPID");
        String ca = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.setAllFormulaDataByPID(ca);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getFormulaByPID method, of class PropertyQueries.
     */
    @Test
    public void testGetFormulaByPID() {
        System.out.println("getFormulaByPID");
        String PID = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getFormulaByPID(PID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getNameByPID method, of class PropertyQueries.
     */
    @Test
    public void testGetNameByPID() {
        System.out.println("getNameByPID");
        String PID = "";
        PropertyQueries instance = new PropertyQueries();
        String expResult = "";
        String result = instance.getNameByPID(PID);
        assertEquals(expResult, result);
    }

    /**
     * Test of getClusterByPID method, of class PropertyQueries.
     */
    @Test
    public void testGetClusterByPID() {
        System.out.println("getClusterByPID");
        String PID = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getClusterByPID(PID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPropertyDataByPID method, of class PropertyQueries.
     */
    @Test
    public void testGetPropertyDataByPID() {
        System.out.println("getPropertyDataByPID");
        String PID = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getPropertyDataByPID(PID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getFIDByPID method, of class PropertyQueries.
     */
    @Test
    public void testGetFIDByPID() {
        System.out.println("getFIDByPID");
        String PID = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getFIDByPID(PID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAbbrevByPID method, of class PropertyQueries.
     */
    @Test
    public void testGetAbbrevByPID() {
        System.out.println("getAbbrevByPID");
        String PID = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getAbbrevByPID(PID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAbbrevBySystem method, of class PropertyQueries.
     */
    @Test
    public void testGetAbbrevBySystem() {
        System.out.println("getAbbrevBySystem");
        String system = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getAbbrevBySystem(system);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAbbrevByName method, of class PropertyQueries.
     */
    @Test
    public void testGetAbbrevByName() {
        System.out.println("getAbbrevByName");
        String Name = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getAbbrevByName(Name);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getNameByAbbrev method, of class PropertyQueries.
     */
    @Test
    public void testGetNameByAbbrev() {
        System.out.println("getNameByAbbrev");
        String Abbrev = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getNameByAbbrev(Abbrev);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getNameBySystem method, of class PropertyQueries.
     */
    @Test
    public void testGetNameBySystem() {
        System.out.println("getNameBySystem");
        String system = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getNameBySystem(system);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPIDByCluster method, of class PropertyQueries.
     */
    @Test
    public void testGetPIDByCluster() {
        System.out.println("getPIDByCluster");
        String c = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getPIDByCluster(c);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPIDByFormula method, of class PropertyQueries.
     */
    @Test
    public void testGetPIDByFormula() {
        System.out.println("getPIDByFormula");
        String formula = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getPIDByFormula(formula);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPIDBySystem method, of class PropertyQueries.
     */
    @Test
    public void testGetPIDBySystem() {
        System.out.println("getPIDBySystem");
        String system = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getPIDBySystem(system);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPIDByName method, of class PropertyQueries.
     */
    @Test
    public void testGetPIDByName() {
        System.out.println("getPIDByName");
        String name = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getPIDByName(name);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPIDByAbbrev method, of class PropertyQueries.
     */
    @Test
    public void testGetPIDByAbbrev() {
        System.out.println("getPIDByAbbrev");
        String abbrev = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getPIDByAbbrev(abbrev);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDescriptionByPID method, of class PropertyQueries.
     */
    @Test
    public void testGetDescriptionByPID() {
        System.out.println("getDescriptionByPID");
        String PID = "";
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getDescriptionByPID(PID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getFIDByCluster method, of class PropertyQueries.
     */
    @Test
    public void testGetFIDByCluster() {
        System.out.println("getFIDByCluster");
        int cluster = 0;
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getFIDByCluster(cluster);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getFormulasByCluster method, of class PropertyQueries.
     */
    @Test
    public void testGetFormulasByCluster() {
        System.out.println("getFormulasByCluster");
        int cluster = 0;
        PropertyQueries instance = new PropertyQueries();
        List expResult = null;
        List result = instance.getFormulasByCluster(cluster);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getClusterNumber method, of class PropertyQueries.
     */
    @Test
    public void testGetClusterNumber() {
        System.out.println("getClusterNumber");
        String cluster = "";
        PropertyQueries instance = new PropertyQueries();
        int expResult = 0;
        int result = instance.getClusterNumber(cluster);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
