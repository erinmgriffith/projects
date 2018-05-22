/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author eringriffith
 */
public class SearchModel extends DataAccess.PropertyQueries {
    
    private String system;
        private String prop1;
        private String prop2;
        private String prop3;

        public SearchModel(String System, String Wanted, String Given_1 , String Given_2){
            system=System;
            prop1=Wanted;
            prop2=Given_1;
            prop3=Given_2;
    }
     public SearchModel(String System, String Wanted, String Given_1){
         system=System;
            prop1=Wanted;
            prop2=Given_1;
    }
     
     
     // find clusters with wanted property and list.
     
     
}
