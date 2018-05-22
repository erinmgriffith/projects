/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;
import javax.ejb.Stateless;

/**
 *
 * @author Carley
 */
@Stateless
public class Relation {
    private int relation;

    private String cluster;
    private String fromProperty;
    private String toProperty;
    private String formula;
public Relation(){
    
}
    public Relation(int Relation, String Cluster, String Formula, String FromProperty, String ToProperty ) {
        this.relation =Relation;
        this.cluster = Cluster;
        this.fromProperty = FromProperty;
        this.toProperty = ToProperty;
        this.formula = Formula;
    }

    public String getCluster() {
        return cluster;
    }

    public String getFromProperty() {
        return fromProperty;
    }

    public String getToProperty() {
        return toProperty;
    }

    public String getFormula() {
        return formula;
    }
 public int getRelation() {
        return relation;
    }
}
