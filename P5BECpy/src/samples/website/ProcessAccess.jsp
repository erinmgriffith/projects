<%--
    Document   : ProcessPayment
    Created on : Jul 28, 2014, 11:38:19 AM
    Author     : eringriffith
<!-- this document contains code that is based off of the APS quick start -->
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
        <%@page import="Database.QueryMemberAccess"%>
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
        <title>Access</title>

        <!-------------*************** set APS onload ***************--------------->
        <script type='text/javascript'>
            window.onAmazonLoginReady = function () {
                amazon.Login.setClientId('removed for security');
                amazon.Login.setSandboxMode(true);
            };
        </script>

        <!-------------*************** import sdk ***************--------------->
        <script type='text/javascript'
                src='https://static-na.payments-amazon.comremoved for security'>
        </script>
        
    </head>



<!-- launches the script that checks if user has access and begins payment process -->
    <body onload="autoAuth()">
        <script src="autoLogin.js"></script>
        <h2 id="message"></h2>

        <script type="text/javascript">
            document.getElementById('Logout').onclick = function () {
                amazon.Login.logout();
            };
        </script>

        <script>
            
            function autoAuth() {
                var options = {};
                options.scope = 'profile';
                options.auto = 'true';

                amazon.Login.authorize(options, function (response) {
                    if (response.error) {
                        return;
                    }
//upon validation access token is retrieved and the value of product attributes is retrieved from local storage
                    amazon.Login.retrieveProfile(response.access_token, function (response) {

                        var Email = document.getElementById("CustomerEmail");
                        Email.value = response.profile.PrimaryEmail;
                        var ID = document.getElementById("CustomerId");
                        ID.value = response.profile.CustomerId;
                        var Name = document.getElementById("CustomerName");
                        Name.value = response.profile.Name;
                        var ProductId = document.getElementById("ProductId");
                        ProductId.value = localStorage.ProductId;
                        var ProductURL = document.getElementById("ProductURL");
                        ProductURL.value = localStorage.ProductURL;

                        var CID = response.profile.CustomerId.toString();
                        var cName = response.profile.CustomerId.toString();
                        var cEmail = response.profile.CustomerId.toString();
                        localStorage.setItem("CustomerId", CID);

                        localStorage.setItem("CustomerName", cName);
                        localStorage.setItem("CustomerEmail", cEmail);
                        if (window.console && window.console.log)
                            window.console.log(response);
                        document.QueryMemberAccess.submit();
                        document.getElementById("message").innerHTML = "Hello, " + response.profile.Name + ".  " + "<br>" + "Please choose a payment option from below.";
                        if (window.console && window.console.log)
                            window.console.log(response);
                    });


//if user does not have access, payment popus comes up with wallet info

                    new OffAmazonPayments.Widgets.Wallet({sellerId: 'removed for security reasons',
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



        <form name="QueryMemberAccess" action="QueryMemberAccess" method="get">
            <table>
                <tr>
                    <td><input type="hidden" name="CustomerId"  id="CustomerId" value=" "></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="CustomerName" id="CustomerName" value=" "></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="CustomerEmail" id="CustomerEmail" value=" "></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="ProductId" id="ProductId" value=" "></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="ProductURL" id="ProductURL" value=" "></td>
                </tr>

                <td><input type="button" onclick="amazon.Login.logout()" id="Logout"  value="Logout"></td>
            </table>
        </form>





    </div
</body>
</html>
