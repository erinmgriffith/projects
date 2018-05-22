/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import javax.ejb.Stateless;

/**
 *
 * @author eringriffith
 */


@Stateless
public class Formula {
    private String formula;
        private String formulaID;
        private String propertyID;
        private String cluster;
private boolean wasUsed;
public Formula(){
    
}


    public Formula(String Cluster, String Formula, String PropertyID, String FormulaID) {
        this.formula = Formula;
        this.formulaID = FormulaID;
      this.propertyID=PropertyID;
      this.cluster=Cluster;
      this.wasUsed=false;
    }

    public String getFormula() {
        return formula;
    }

    public String getformulaID() {
        return formulaID;
    }

    public String getPropertyID() {
        return propertyID;
    }

    public String getCluster() {
        return cluster;
    }
        public boolean getWasUsed() {
        return wasUsed;
    }
    public void setWasUsed(){
        this.wasUsed=true;
    }
}
