/*******************************************************************************
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
 * *****************************************************************************
 */

package samples;

import java.io.PrintWriter;

import samples.utils.TaxAndShippingRates;
import samples.utils.Utilities;

import com.amazonservices.mws.offamazonpayments.*;
import com.amazonservices.mws.offamazonpayments.model.*;
import com.amazonservices.mws.offamazonpaymentsipn.model.AuthorizationNotification;


public class SimpleCheckoutExample extends CheckoutExampleBase {

    private String amazonOrderReferenceId;
    private String authorizationId ;
    private String amazonAuthorizationId ;
    private String captureId ;
private String orderTotal;
private String subTotal="2.00";
private String storeName;
private String productId;
private String productURL;

  public SimpleCheckoutExample() {
    super(null, null, null);
  }
//    public SimpleCheckoutExample(String amazonOrderReferenceID, String Price, String Store, String ProductId, String ProductURL, OffAmazonPaymentsServiceConfig config,
//            OffAmazonPaymentsServiceClient service, PrintWriter outStream) {
  public SimpleCheckoutExample(String amazonOrderReferenceID, OffAmazonPaymentsServiceConfig config,
            OffAmazonPaymentsServiceClient service, PrintWriter outStream) {
        super(config, service, outStream);
        amazonOrderReferenceId=amazonOrderReferenceID;
//        orderTotal=Price;
//        subTotal=Price;
//        storeName=Store;
//        productId=ProductId;
//        productURL=ProductURL;
        outStream.println("In simple checkout example " + amazonOrderReferenceId);
        this.authorizationId = amazonOrderReferenceId + "a01";
        System.out.println(" authorization id = " + this.authorizationId );
        this.captureId = this.authorizationId + "c01";
    }

    /**
     * It sets Order Reference object with Order Total calculated with
     * tax, and Shipping charge and other optional parameters
     * provided
     * 
     * @throws OffAmazonPaymentsServiceException
 
     */
    public void addOrderReferenceDetails(String sellerNote, String orderId, String customNote, String storeName,
            String subtotal, String shippingType) throws OffAmazonPaymentsServiceException {
        OrderReferenceDetails response = getOrderDetails();
        Utilities.validateResponseNotNull(response, "OrderReferenceDetails");
        Destination destination = response.getDestination();
        TaxAndShippingRates buyerRates = new TaxAndShippingRates(destination);
//                double orderTotal = 2.00;
        double orderTotal = buyerRates.getTotalAmountWithTaxAndShipping(Double.parseDouble(subTotal),
                Integer.parseInt(shippingType));

        SellerOrderAttributes optionalSellerOrderAttributes = new SellerOrderAttributes();
        if (orderId != null && !orderId.equals("")) {
            optionalSellerOrderAttributes.setSellerOrderId(orderId);
        }

        if (customNote != null && !customNote.equals("")) {
            optionalSellerOrderAttributes.setCustomInformation(customNote);
        }

        if (storeName != null && !storeName.equals("")) {
            optionalSellerOrderAttributes.setStoreName(storeName);
        }

        SetOrderReferenceDetailsResponse setOrderReferenceDetailResponse = setOrderDetails(orderTotal, sellerNote,
                optionalSellerOrderAttributes);
        Utilities.validateResponseNotNull(setOrderReferenceDetailResponse, "SetOrderReferenceDetailResponse");
        SetOrderReferenceDetailsSample.printResponse(setOrderReferenceDetailResponse, outStream);

    }

    /**
     * Method to make get order reference details, Use this method to
     * determine buyer's shipping address detail
     * 
     * @return OrderReferenceDetails
     * @throws OffAmazonPaymentsServiceException
     */
    public OrderReferenceDetails getOrderDetails() throws OffAmazonPaymentsServiceException {
        GetOrderReferenceDetailsRequest request = new GetOrderReferenceDetailsRequest();
        request.setAmazonOrderReferenceId(this.amazonOrderReferenceId);
        request.setSellerId(this.sellerId);
        outStream.println("Order Ref: " + this.amazonOrderReferenceId);
        outStream.println("Seller Id: " + this.sellerId);
        outStream.println("getOrderReferenceDetails:");
        GetOrderReferenceDetailsResponse response = this.service.getOrderReferenceDetails(request);
        return response.getGetOrderReferenceDetailsResult().getOrderReferenceDetails();
    }

    /**
     * Method to set required seller details to the Order Reference Object
     * 
     * @param orderTotalCharge
     * @param optionalSellerNote
     * @param optionalSellerOrderAttributes
     * @return SetOrderReferenceDetailsResponse
     * @throws OffAmazonPaymentsServiceException
     */
    public SetOrderReferenceDetailsResponse setOrderDetails(double orderTotalCharge, String optionalSellerNote,
            SellerOrderAttributes optionalSellerOrderAttributes) throws OffAmazonPaymentsServiceException {

        OrderTotal orderTotal = new OrderTotal();
        if ((orderTotalCharge < 0.00)) {
            throw new OffAmazonPaymentsServiceException("Order Total" + "is required to set order detail");
        } else {
            /*
             * Set the total amount for the purchase using OrderTotal Class
             */
            orderTotal.setAmount(new Double(orderTotalCharge).toString());
            orderTotal.setCurrencyCode(this.config.getCurrencyCode());

            OrderReferenceAttributes orderReferenceAttributes = new OrderReferenceAttributes();
            orderReferenceAttributes.setOrderTotal(orderTotal);

            /*
             * Set seller note for this order, this is optional parameter
             */
            if (optionalSellerNote != null) {
                orderReferenceAttributes.setSellerNote(optionalSellerNote);
            }

            /*
             * Set seller order attribute, this is optional parameter
             */
            if (optionalSellerOrderAttributes != null) {
                orderReferenceAttributes.setSellerOrderAttributes(optionalSellerOrderAttributes);
            }

            SetOrderReferenceDetailsRequest request = new SetOrderReferenceDetailsRequest();
            request.setAmazonOrderReferenceId(this.amazonOrderReferenceId);
            request.setSellerId(this.sellerId);
            request.setOrderReferenceAttributes(orderReferenceAttributes);

            SetOrderReferenceDetailsResponse response = this.service.setOrderReferenceDetails(request);
            return response;
        }
    }

    /**
     * Method to confirm a Order Reference object
     * And to move ORO from DRAFT to OPEN state
     * 
     * @throws OffAmazonPaymentsServiceException
     */
    public void confirmOrderReference() throws OffAmazonPaymentsServiceException {
        ConfirmOrderReferenceRequest request = new ConfirmOrderReferenceRequest();
        request.setAmazonOrderReferenceId(this.amazonOrderReferenceId);
        request.setSellerId(this.sellerId);

        ConfirmOrderReferenceResponse response = this.service.confirmOrderReference(request);
        Utilities.validateResponseNotNull(response, "ConfirmOrderReferenceResponse");
        ConfirmOrderReferenceSample.printResponse(response, outStream);
    }

    /**
     * Method to get required and optional parameters
     * for authorization and makes request call with
     * give data for the full order total, set in this
     * Order reference
     * 
     * @param captureNow
     * @param fastAuth
     * @param authOption
     * @param softDescriptor
     * @param sellerAuthorizationNote
     * @throws OffAmazonPaymentsServiceException
     */
    public void authorize(boolean captureNow, int authOption, String softDescriptor, String sellerAuthorizationNote)
            throws OffAmazonPaymentsServiceException {
        authorize(captureNow, authOption, softDescriptor, sellerAuthorizationNote, null, null);
    }

    /**
     * Method to get required and optional parameters
     * for authorization and makes request call with
     * give data for the full order total, set in this
     * Order reference
     * 
     * @param captureNow
     * @param fastAuth
     * @param softDescriptor
     * @param sellerAuthorizationNote
     * @param providerId
     * @param creditAmount
     * @throws OffAmazonPaymentsServiceException
     */
    public void authorize(boolean captureNow, int authOption, String softDescriptor, String sellerAuthorizationNote,
            String providerId, String creditAmount) throws OffAmazonPaymentsServiceException {
        OrderReferenceDetails response = getOrderDetails();
        Utilities.validateResponseNotNull(response, "OrderReferenceDetails");
        /*
         * Optional Parameters
         * Note: Soft Descriptor, Provider Id and Credit Amount are set only if captureNow flag is on
         */
        String optionalSoftDescriptor = null;
        String optionalProviderId = null;
        String optionalCreditAmount = null;
        if (captureNow) {
            optionalSoftDescriptor = softDescriptor;
            optionalProviderId = providerId;
            optionalCreditAmount = creditAmount;
        }
        String optionalSellerAuthNote = sellerAuthorizationNote;
        AuthorizeResponse authorizeResponse = authorizeOrderAmount(response, optionalSoftDescriptor,
                optionalSellerAuthNote, captureNow, authOption, optionalProviderId, optionalCreditAmount);
        Utilities.validateResponseNotNull(authorizeResponse, "AuthorizeResponse");
        AuthorizeSample.printResponse(authorizeResponse, outStream);
//          System.out.println("simple checkout 228" + response + optionalSoftDescriptor +  optionalSellerAuthNote + captureNow+ authOption + optionalProviderId + optionalCreditAmount );
    }

    /**
     * Method to authorize the order amount
     * 
     * @param orderReferenceDetail
     * @param softDescriptor
     * @param sellerAuthNote
     * @param captureNow
     * @param authOption
     * @param providerId;
     * @param creditAmount;
     * @return AuthorizeResponse
     * @throws OffAmazonPaymentsServiceException
     */
    public AuthorizeResponse authorizeOrderAmount(OrderReferenceDetails orderReferenceDetail, String softDescriptor,
            String sellerAuthNote, boolean captureNow, int authOption, String providerId, String creditAmount)
            throws OffAmazonPaymentsServiceException {
//        System.out.println("simple checkout 247" + orderReferenceDetail + softDescriptor +  sellerAuthNote + captureNow+ authOption + providerId + creditAmount );
//    
        if (orderReferenceDetail == null) {
            throw new OffAmazonPaymentsServiceException("OrderReferenceDetails is NULL");
        }
        if (orderReferenceDetail.getOrderTotal() == null) {
            throw new OffAmazonPaymentsServiceException("Order Total is NULL and not set");
        } else {
            AuthorizeRequest request = new AuthorizeRequest();
            /*
             * Getting the total order amount and currency code from Order Reference
             */
            double authAmount = Double.parseDouble(orderReferenceDetail.getOrderTotal().getAmount());
            String currencyCode = orderReferenceDetail.getOrderTotal().getCurrencyCode();

            Price authTotal = new Price();
            authTotal.setAmount(Double.valueOf(authAmount).toString());
            authTotal.setCurrencyCode(currencyCode);

            request.setAuthorizationAmount(authTotal);
            request.setAmazonOrderReferenceId(this.amazonOrderReferenceId);
            request.setSellerId(this.sellerId);
            request.setAuthorizationReferenceId(this.authorizationId);
            /*
             * If Fast Authorize is required, set Transaction Timeout to 0.
             */
            if (authOption == 2) {
                request.setTransactionTimeout(1);
            }
            /*
             * Optional Parameters
             * Note: Soft Descriptor and Provider Credit List can be set
             * to Authorization request only if captureNow flag is turned on
             */
            if (captureNow) {
                if (softDescriptor != null) {
                    request.setSoftDescriptor(softDescriptor);
                }
                if (providerId != null && creditAmount != null) {
                    request.setProviderCreditList(constructProviderCreditListObject(providerId, creditAmount));
                }
            }

            request.setCaptureNow(new Boolean(captureNow));
            if (sellerAuthNote != null) {
                request.setSellerAuthorizationNote(sellerAuthNote);
            }
            AuthorizeResponse result = this.service.authorize(request);

            /*
             * Setting AmazonAuthorizationId for this object
             */
            if (result != null) {
                this.amazonAuthorizationId = result.getAuthorizeResult().getAuthorizationDetails()
                        .getAmazonAuthorizationId();
            }

            return result;
        }
    }

    /**
     * Method is used to check the status for an Authorization request
     * from CLI samples
     * 
     * @return AuthorizationNotification
     * @throws OffAmazonPaymentsServiceException
     * @throws InterruptedException
     */
    public AuthorizationNotification servletWaitUntilAuthorizationComplete() throws OffAmazonPaymentsServiceException {
//      System.out.println(" Simple checkout ln 317- wait for auth" + this.amazonAuthorizationId);
        return this.servletWaitUntilAuthorizationComplete(this.amazonAuthorizationId);
    }

    /**
     * Method is used to check the status for an Authorization request
     * from cli samples
     * 
     * @return GetAuthorizationDetailsResponse
     * @throws OffAmazonPaymentsServiceException
     * @throws InterruptedException
     */
    public GetAuthorizationDetailsResponse cliWaitUntilAuthorizationComplete() throws OffAmazonPaymentsServiceException {
        return this.cliWaitUntilAuthorizationComplete(this.amazonAuthorizationId);
    }

    /**
     * Method to get the Authorization details
     * 
     * @return GetAuthorizationDetailsResponse
     * @throws OffAmazonPaymentsServiceException
     */
    public GetAuthorizationDetailsResponse getAuthorizationDetails() throws OffAmazonPaymentsServiceException {
//           System.out.println(" Simple checkout ln 340- get auth details" + this.amazonAuthorizationId);
        return this.getAuthorizationDetails(this.amazonAuthorizationId);
    }

    /**
     * Method to capture order total
     * 
     * @param amount
     * @param currencyCode
     * @param amazonAuthorizationId
     * @param softDescriptor
     * @param sellerCaptureNote
     * @return CaptureResponse
     * @throws OffAmazonPaymentsServiceException
     */
    public CaptureResponse captureOrderAmount(String amount, String currencyCode, String amazonAuthorizationId,
            String softDescriptor, String sellerCaptureNote) throws OffAmazonPaymentsServiceException {
//           System.out.println(" Simple checkout ln 357- capture order amount" + this.captureId);
        return this.captureOrderAmount(amount, currencyCode, amazonAuthorizationId, this.captureId, softDescriptor,
                sellerCaptureNote);

    }

    /**
     * Method to capture order total with provider credit
     * 
     * @param amount
     * @param providerId;
     * @param creditAmount;
     * @param currencyCode
     * @param amazonAuthorizationId
     * @param softDescriptor
     * @param sellerCaptureNote
     * @return CaptureResponse
     * @throws OffAmazonPaymentsServiceException
     */
    public CaptureResponse captureOrderAmount(String amount, String currencyCode, String amazonAuthorizationId,
            String softDescriptor, String sellerCaptureNote, String providerId, String creditAmount)
            throws OffAmazonPaymentsServiceException {
//                 System.out.println(" Simple checkout ln 379- capture order amount with credit" + this.captureId);
        return this.captureOrderAmount(amount, currencyCode, amazonAuthorizationId, this.captureId, softDescriptor,
                sellerCaptureNote, providerId, creditAmount);
    }

    /**
     * Method to Close an Order reference
     * 
     * @throws OffAmazonPaymentsServiceException
     */
    public void closeOrder() throws OffAmazonPaymentsServiceException {
        CloseOrderReferenceRequest request = new CloseOrderReferenceRequest();
        request.setSellerId(this.sellerId);
        request.setAmazonOrderReferenceId(this.amazonOrderReferenceId);

        CloseOrderReferenceResponse closeOrderReferenceResponse = this.service.closeOrderReference(request);
        Utilities.validateResponseNotNull(closeOrderReferenceResponse, "CloseOrderReferenceResponse");
        CloseOrderReferenceSample.printResponse(closeOrderReferenceResponse, outStream);
    }

}
