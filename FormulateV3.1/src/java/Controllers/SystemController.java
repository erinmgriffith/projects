/*
 * responsible for communication between business logic classes and ui 
 */

package Controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DataAccess.*;
import Models.SystemModel;
import javax.servlet.RequestDispatcher;
import java.lang.*;

/**
 *
 * @author Erin
 */
@WebServlet(name = "SystemController", urlPatterns = {"/SystemController"})
public class SystemController extends HttpServlet {
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

       
    //instantiates the system model class and passes results to ui as attributes
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        SystemModel aSystem = new SystemModel();

        Property[] properties = aSystem.getPropertyData();
        Formula[] formulas = aSystem.getFormulaData();
        Relation[] relations = aSystem.getRelationData();

        request.setAttribute("relations", relations);
        request.setAttribute("properties", properties);
        request.setAttribute("formulas", formulas);

        RequestDispatcher view = request.getRequestDispatcher("myOwnJS.jsp"); //remember to change from test vs.
        view.forward(request, response);
    }


}
