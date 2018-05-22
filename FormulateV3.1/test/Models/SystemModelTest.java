/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import DataAccess.Formula;
import DataAccess.Property;
import DataAccess.Relation;
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
public class SystemModelTest {
    
    public SystemModelTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    @Test
    public void testGetMyRelationData() {
        System.out.println("getMyRelationData");
        SystemModel instance = new SystemModel();
        SystemModel.relationData expResult = instance.getMyRelationData();
        SystemModel.relationData result = instance.getMyRelationData();
    }

    /**
     * Test of getNumberOfRelations method, of class SystemModel.
     */
    @Test
    public void testGetNumberOfRelations() {
        System.out.println("getNumberOfRelations");
        SystemModel instance = new SystemModel();
        int expResult = 78;
        int result = instance.getNumberOfRelations();
        assertEquals(expResult, result);
    }

    /**
     * Test of getMyFormulaData method, of class SystemModel.
     */
    @Test
    public void testGetMyFormulaData() {
        System.out.println("getMyFormulaData");
        SystemModel instance = new SystemModel();
        SystemModel.formulaData expResult = instance.getMyFormulaData();
        SystemModel.formulaData result = instance.getMyFormulaData();
        assertEquals(expResult, result);
    }

    /**
     * Test of getMyPropertyData method, of class SystemModel.
     */
    @Test
    public void testGetMyPropertyData() {
        System.out.println("getMyPropertyData");
        SystemModel instance = new SystemModel();
        SystemModel.propertyData expResult = null;
        SystemModel.propertyData result = instance.getMyPropertyData();
        assertEquals(expResult, result);
    }

    /**
     * Test of getPropertyData method, of class SystemModel.
     */
    @Test
    public void testGetPropertyData() {
        System.out.println("getPropertyData");
        SystemModel instance = new SystemModel();
        Property[] expResult = instance.getPropertyData();
        Property[] result = instance.getPropertyData();
        assertArrayEquals(expResult, result);
    }

    /**
     * Test of getFormulaData method, of class SystemModel.
     */
    @Test
    public void testGetFormulaData() {
        System.out.println("getFormulaData");
        SystemModel instance = new SystemModel();
        Formula[] expResult = instance.getFormulaData();
        Formula[] result = instance.getFormulaData();
        assertArrayEquals(expResult, result);
    }

    /**
     * Test of getRelationData method, of class SystemModel.
     */
    @Test
    public void testGetRelationData() {
        System.out.println("getRelationData");
        SystemModel instance = new SystemModel();
        Relation[] expResult = instance.getRelationData();
        Relation[] result = instance.getRelationData();
        assertArrayEquals(expResult, result);
    }
}
