/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author eringriffith
 */
public class ProcessPaymentServlet extends HttpServlet {

  /**
   * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    try (PrintWriter out = response.getWriter()) {
String ID= request.getParameter("CustomerID");
    }
  }

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  /**
   * Handles the HTTP <code>GET</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
   
    try (PrintWriter out = response.getWriter()) {
    String CustomerId = request.getParameter("CustomerId");
String CustomerName = request.getParameter("CustomerName");
String CustomerEmail = request.getParameter("CustomerEmail") ;
String ProductId= request.getParameter("ProductId");
String ProductURL=request.getParameter("ProductURL");

 try {
      ManipulateMemberData.run(4, CustomerId, ProductId, CustomerName, CustomerEmail);
  out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet QueryMemberAccess</title>");      
      out.println("</head>");
      out.println("<body>");
    out.println("<script>   window.location.assign(\"  " + ProductURL + " \");</script>");
      out.println("</body>");
      out.println("</html>");
 


    } catch (Exception ex) {
      Logger.getLogger(QueryMemberAccess.class.getName()).log(Level.SEVERE, null, ex);
    }
      /* TODO output your page here. You may use following sample code. */
      
    }
  }

  /**
   * Handles the HTTP <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  /**
   * Returns a short description of the servlet.
   *
   * @return a String containing servlet description
   */
  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
