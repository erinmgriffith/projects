<!-- /*************************************************************************
 *  Copyright 2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *
 *  You may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at:
 *  http://aws.amazon.com/apache2.0
 *  This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
 *  CONDITIONS OF ANY KIND, either express or implied. See the License
 *  for the
 *  specific language governing permissions and limitations under the
 *  License.
 * ****************************************************************************
 * -->
<!DOCTYPE html>
<html>
    <head>
        <script src='common.js'></script>


        <script>


        </script>
    </head>
    <body onload="doStuff();">

        <script>


            function doStuff() {


                var ProductId = document.getElementById("ProductId");
                ProductId.value = localStorage.ProductId;
                var ProductURL = document.getElementById("ProductURL");
                ProductURL.value = localStorage.ProductURL;
                var CustomerId = document.getElementById("CustomerId");
                CustomerId.value = localStorage.CustomerId;
                var CustomerName = document.getElementById("CustomerName");
                CustomerName.value = localStorage.CustomerName;
                var CustomerEmail = document.getElementById("CustomerEmail");
                CustomerEmail.value = localStorage.CustomerEmail;
                document.AddPurchase.submit();

            }

        </script>
        <form name="AddPurchase" action="AddPurchase" method="get">
            <table>

                <tr>

                    <td><input type="hidden"  id="CustomerId" name="CustomerId" value= "default "></td>
                </tr>
                <tr>
                    <td><input type="hidden" id="ProductId" name="ProductId" value= "default  "></td>
                </tr>
                <tr>
                    <td><input type="hidden" id="ProductURL" name="ProductURL" value= " default"></td>
                </tr>

                <tr>
                    <td><input type="hidden" id="CustomerEmail"  name="CustomerEmail" value= "default "></td>
                </tr>

                <tr>

                    <td><input type="hidden" id="CustomerName" name="CustomerName" value= " default"></td>


                </tr>
            </table>
        </form>
    </body>
</html>