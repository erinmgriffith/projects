<%-- 
    Document   : HandlePayment
    Created on : Aug 2, 2014, 11:33:12 AM
    Author     : eringriffith
--%>
<%@page import="com.sun.faces.application.WebPrintWriter"%>
<%@page import="samples.cli.SimpleCheckoutExampleCLI"%>
<%@page import="samples.utils.NewstreamOrderReferenceId"%>
<%@page import="samples.servlet.SimpleCheckoutServlet"%>
<%@page import="samples.SetOrderReferenceDetailsSample"%>
<%@page import=" samples.utils.PropertyBundle;"%>
<%@page import="com.amazonservices.mws.offamazonpaymentsipn.model.OrderReference.*;"%>
<%@page import="com.amazonservices.mws.offamazonpayments.OffAmazonPaymentsService.*;"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
           uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" 
           uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
  <script type='text/javascript' 
    src='https://static-na.payments-amazon.com/OffAmazonPayments/us/sandbox/js/W                       '>
  </script>
<!DOCTYPE html>
<html>
  <head>
    <script src='common.js'></script>
<%@page import ="samples.cli.SimpleCheckoutExampleCLI;"%>
<%@ page import="java.io.*,java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
          <jsp:include page="HandleLogin.jsp"/>
    <form name="Order" action="SimpleCheckoutServlet" method="get"></form>

        <div id="walletWidgetDiv"></div>
        <script type='text/javascript'>
            (function(d) {
                var a = d.createElement('script');
                a.type = 'text/javascript';
                a.async = true;
                a.id = 'amazon-login-sdk';
                a.src = 'https://api-cdn.amazon.com/sdk/login1.js';
                d.getElementById('amazon-root').appendChild(a);
            })(document);
        </script>
    
        
        <!-------------*************** Wallet Widget- create and define attributes  ***************--------------->  
        <script>

              new OffAmazonPayments.Widgets.Wallet({sellerId: '  ',
                onOrderReferenceCreate: function (orderReference) {
                  var ORID = document.getElementById("ORID");
                  ORID.value = orderReference.getAmazonOrderReferenceId();
                  alert(ORID);
                },
                design: {
                  size: {width: '400px', height: '260px'}
                },
                onPaymentSelect: function (orderReference) {
                  request.create(orderReference);
                },
                onError: function (error) {
                }
              }).bind("walletWidgetDiv");
              var token = response.access_token;
              getUserInfo(token);
       
   
          

 </script>

 
 
 
    <form name="Order" action="SimpleCheckoutServlet" method="get">
      <table>
                <tr>
          <td><input type="hidden" name="ProductId"  id="Newstream" value=" "<td>
        </tr>
           <tr>
          <td><input type="hidden" name="CustomerId"  id="CustomerId" value=" "<td>
        </tr>
        <tr>
          <td><input type="hidden" name="amazonOrderReferenceId"  id="ORID" value=" "<td></td>>
        </tr>
          <td><input type="submit"  value="checkout"></td>
        </tr>
      </table>
    </form>
 

    </div>
  </body>
</html>
