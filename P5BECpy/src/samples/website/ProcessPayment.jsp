<%-- 
    Document   : ProcessPayment
    Created on : Jul 28, 2014, 11:38:19 AM
    Author     : eringriffith  
Page processes payment for product and communicates with APS payment servers
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql"   uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <script src='common.js'></script>
        <%@page import="samples.servlet.customerServlet"%>
        <%@page import="Database.CustomerData"%>
        <%@ page import="java.io.*,java.util.*" %>
        <%@ page import="samples.cli.*;" %>
        <%@page import="com.sun.faces.application.WebPrintWriter"%>
        <%@page import="samples.cli.SimpleCheckoutExampleCLI"%>
        <%@page import="samples.utils.NewstreamOrderReferenceId"%>
        <%@page import="samples.servlet.SimpleCheckoutServlet"%>
        <%@page import="samples.SetOrderReferenceDetailsSample"%>
        <%@page import=" samples.utils.PropertyBundle;"%>
        <%@page import="com.amazonservices.mws.offamazonpaymentsipn.model.OrderReference.*;"%>
        <%@page import="com.amazonservices.mws.offamazonpayments.OffAmazonPaymentsService.*;"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payments</title>

        <!-------------*************** set APS onload ***************--------------->
        <script type='text/javascript'>
          window.onAmazonLoginReady = function () {
            amazon.Login.setClientId('removed for security');
            amazon.Login.setSandboxMode(true);
          };
          
    
        </script>
        <script src="autoLogin.js"></script>
        <!-------------*************** import sdk ***************--------------->
        <script type='text/javascript' 
                src='https://static-na.payments-amazon.com/OffAmazonPayments/u'removed for security'>
        </script>
        <!-------------*************** gets access token ***************--------------->
        <script type='text/javascript'>
          function getURLParameter(name, source) {
            return decodeURIComponent((new RegExp('[?|&|#]' + name + '=' +
                    '([^&;]+?)(&|#|;|$)').exec(source) || [, ""])[1].replace(/\+/g,
                    '%20')) || null;
          }
          var accessToken = getURLParameter("access_token", location.hash);
          if (typeof accessToken === 'string' && accessToken.match(/^Atza/)) {
            document.cookie = "amazon_Login_accessToken=" + accessToken + ";secure";
          }
          window.onAmazonLoginReady = function () {
            amazon.Login.setClientId(removed for security'');
            amazon.Login.setUseCookie(true);
          };

        </script>
    </head>



 
    <body onload="autoAuth()">
    
        
        
        
        
        
        <h2 id="message"></h2>
        <script type="text/javascript">
          document.getElementById('Logout').onclick = function () {
            amazon.Login.logout();
          };
        </script>

    <script> 
  
          function autoAuth() {
            var redirect=false;
            var options = {};
            options.scope = 'profile';
            options.auto = 'true';
            
            amazon.Login.authorize(options, function (response) {
              
              if (response.error) {
                return;
              }
    
                                    amazon.Login.retrieveProfile(response.access_token, function(response) {        
                   var CustomerEmail = document.getElementById("Email");
              CustomerEmail.value =  response.profile.PrimaryEmail;
              var CustomerId = document.getElementById("ID");
              CustomerId.value = response.profile.CustomerId;
              var CustomerName = document.getElementById("Name");
              CustomerName.value = response.profile.Name;
    var ProductId = document.getElementById("ProductId");
              ProductId.value =    localStorage.ProductId;
   var ProductURL = document.getElementById("ProductURL");
              ProductURL.value =    localStorage.ProductURL;
              var Store=document.getElementById("Store");
              Store.value= localStorage.Store;
              var Price = document.getElementById("Price");
              Price.value= localSorage.Price;
  var  ProductId= document.getElementById("ProductId");
  ProductId.value=localStorage.ProductId;
var CID=response.profile.CustomerId.toString();
var cName=response.profile.CustomerId.toString();
var cEmail=response.profile.CustomerId.toString();
      localStorage.setItem("CustomerId", CID);

localStorage.setItem("CustomerName", cName);
localStorage.setItem("CustomerEmail", cEmail);
           
              if (window.console && window.console.log) 
                window.console.log(response);
         
                document.getElementById("message").innerHTML= "Hello, " + response.profile.Name + ".  " + "<br>" +  "Please choose a payment option from below.";
                if (window.console && window.console.log)
                  window.console.log(response);
              });
  
              new OffAmazonPayments.Widgets.Wallet({sellerId 
                onOrderReferenceCreate: function (orderReference) {
                  var ORID = document.getElementById("ORID");
             
                  ORID.value = orderReference.getAmazonOrderReferenceId();
          
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

            });

          }

        </script>



        <div id="walletWidgetDiv"></div>

        <form name="Order" action="SimpleCheckoutServlet" method="get">
            <table>
                                <tr>
                    <td><input type="hidden" name="Store"  id="Store" value=" " <td>
                </tr>
                                <tr>
                    <td><input type="hidden" name="Title"  id="Title" value="  "<td>
                </tr>
                                <tr>
                    <td><input type="hidden" name="Price"  id="Price" value=" "<td>
                </tr>
              
                    <td><input type="hidden" name="ProductId"  id="ProductId" value=" "<td>
                </tr>
                <tr>
                    <td><input type="hidden" name="CustomerId"  id="CustomerId" value=" "<td>
                </tr>
                  <tr>
                    <td><input type="hidden" name="CustomerName"  id="CustomerName" value=" "<td>
                </tr>
                <tr>
                    <td><input type="hidden" name="amazonOrderReferenceId"  id="ORID" value=" "</td>
                </tr>
                 <tr>
                    <td><input type="hidden" name="DirectCapture"  id="Capture" value="on"</td>
                </tr>
                   <tr>
                    <td><input type="hidden" name="ProductURL"  id="ProductURL" value=" "</td>
                </tr>
                <td><input type="submit"  value="Submit"></td>

                <td><input type="button" onclick="amazon.Login.logout()" id="Logout"  value="Logout"></td></tr>
            </table>
        </form>
<!--
     <form name="AddPurchase" action="AddPurchase" method="get">
            <table>
                                <tr>
     <td><input type="hidden" name="ProductIdP"  id="ProductIdP" value=" "<td>
                </tr>
                                <tr>
                <td><input type="hidden" name="CustomerIdP"  id="CustomerIdP" value=" "<td>
                </tr>
                                <tr>
                    <td><input type="hidden" name="ProductURLP"  id="ProductURLP" value=" "</td>
                </tr>
 <tr>
                    <td><input type="hidden" name="CustomerEmailP"  id="CustomerEmailP" value=" "</td>
                </tr>-->

    </div>

</body>
</html>
