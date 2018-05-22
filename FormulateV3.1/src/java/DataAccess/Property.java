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
public class Property {
    private String name;
        private String abbreviation;
        private String system;
        private String id;
        private String description;

public Property(){
    
}


    public Property(String Name, String Abbreviation, String System, String ID, String Description) {
        this.name = Name;
        this.abbreviation = Abbreviation;
      this.system=System;
      this.id=ID;
      this.description=Description;
    }

    public String getName() {
        return name;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public String getSystem() {
        return system;
    }

    public String getID() {
        return id;
    }
     public String getDescription() {
        return description;
    }
}
