/* 
 Author     : eringriffith
 <!-- this document contains code that is based off of the APS quick start
 Some of this code may seem redundant because it is repeated at other points in the program. This is because there are multiple entry points and a
 multiple points where APS servers must be communicated with, while we simultaneously are updating inhouse records-->
 --%>
 */

function autoAuth() {
    var options = {};
    options.scope = 'profile';
    options.auto = 'true';


    amazon.Login.setClientId('removed for security reasons');
    amazon.Login.setSandboxMode(true);
    amazon.Login.authorize(options, function (response) {

        if (response.error) {
            return;
        }

        amazon.Login.retrieveProfile(response.access_token, function (response) {
            var Email = document.getElementById("Email");
            Email.value = response.profile.PrimaryEmail;
            var ID = document.getElementById("ID");
            ID.value = response.profile.CustomerId;
            var Name = document.getElementById("Name");
            Name.value = response.profile.Name;
            window.location.assign(Product);
            if (window.console && window.console.log)
                window.console.log(response);


            document.getElementById("message").innerHTML = "Hello, " + response.profile.Name + ".  " + "<br>" + "Please choose a payment option from below.";
            if (window.console && window.console.log)
                window.console.log(response);
        });

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

//          }