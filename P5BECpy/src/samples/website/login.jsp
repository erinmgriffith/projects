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
<%@include file="config.jsp"%>
<html>
<head>
<script type='text/javascript' src='common.js'></script>
<script type='text/javascript' src='<%=clientConfig.getWidgetURL()%>'></script>
</head>
<body>
	<div id='payWithAmazonDiv'></div>
	<script type='text/javascript'>
		var amazonOrderReferenceId;
		new OffAmazonPayments.Widgets.Button(
		{
			sellerId : '<%=clientConfig.getSellerId()%>',
			useAmazonAddressBook : true,
			onSignIn : function(orderReference) {
				amazonOrderReferenceId = orderReference.getAmazonOrderReferenceId();
				window.location = '<%=request.getContextPath()%>/address.jsp?session='
					   + amazonOrderReferenceId;
			},
			onError : function(error) {
			   alert(error);
			}
            
	    }).bind('payWithAmazonDiv');
	</script>
</body>
</html>