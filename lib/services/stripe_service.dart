import 'dart:convert';

import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {

  Function()? onPaymentSuccess;
  Function()? onPaymentFailure;

  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment(int paymentAmount,
      Function() onPaymentSuccess,
      Function() onPaymentFailure) async {
    this.onPaymentSuccess = onPaymentSuccess;
    this.onPaymentFailure = onPaymentFailure;

    try {
      String? paymentIntent = await _createPaymentIntent(
          paymentAmount, inrCurrency);
      if (paymentIntent == null) {
        return;
      }

      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent,
              merchantDisplayName: 'Flick',
              billingDetailsCollectionConfiguration:
                  const BillingDetailsCollectionConfiguration(
                      name: CollectionMode.always,
                      address: AddressCollectionMode.full,
                      attachDefaultsToPaymentMethod: true
                  )
          )
      );

      debugPrint("Payment sheet initialized and now processing payment");
      await _processPayment();
    } catch (e) {
      debugPrint("Error while making payment: $e");
      onPaymentFailure();
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
      debugPrint("Payment successful");
      onPaymentSuccess!();
    } catch (e) {
      debugPrint("Error while processing payment: $e");
      onPaymentFailure!();
    }
  }

  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      Map<String, dynamic> data = {
        "amount": _calculateAmountForStipePayment(amount),
        "currency": currency,
        "description": "Payment for your Flick order",
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $stipeSecretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: data,
      );

      debugPrint("Response from stripe: ${response.body}");
      return json.decode(response.body)['client_secret'];
    } catch (e) {
      debugPrint("Error while creating payment intent: $e");
      onPaymentFailure!();
    }

    return null;
  }

  // Future<String?> createCustomer() async {
  //   try {
  //     Map<String, dynamic> data = {
  //       "name": "Aviral Kaushik",
  //       "address[line1]": "1234 Main Street",
  //       "address[postal_code]": "98140",
  //       "address[city]": "San Francisco",
  //       "address[state]": "CA",
  //       "address[country]": "US",
  //     };
  //
  //     var response = await http.post(
  //       Uri.parse('https://api.stripe.com/v1/customers'),
  //       headers: {
  //         'Authorization': 'Bearer $stipeSecretKey',
  //       },
  //       body: data,
  //     );
  //
  //     debugPrint("Response from stripe: ${response.body}");
  //     debugPrint("Customer ID: ${json.decode(response.body)['id']}");
  //     return json.decode(response.body)['id'];
  //   } catch (e) {
  //     debugPrint("Error while creating payment intent: $e");
  //   }
  //   return null;
  // }

  String _calculateAmountForStipePayment(int amount) {
    return (amount * 100).toString();
  }
}