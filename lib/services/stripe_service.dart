import 'dart:convert';

import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {

  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment() async {
    try {
      String? paymentIntent = await _createPaymentIntent(100, inrCurrency);
      if (paymentIntent == null) {
        return;
      }

      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntent,
        style: ThemeMode.dark,
        merchantDisplayName: 'Flick',
      ));

      await _processPayment();
    } catch (e) {
      debugPrint("Error while making payment: $e");
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      debugPrint("Error while processing payment: $e");
    }
  }

  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      Map<String, dynamic> data = {
        "amount": _calculateAmountForStipePayment(amount),
        "currency": currency
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
    }

    return null;
  }

  String _calculateAmountForStipePayment(int amount) {
    return (amount * 100).toString();
  }
}