import 'package:flick/components/simple_header.dart';
import 'package:flick/features/order/components/payment_button_widget.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/models/pre_order.dart';
import 'package:flick/services/stripe_service.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
    required this.preOrder});

  final PreOrder preOrder;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  final StripeService _stripeService = StripeService.instance;

  late DialogHelper dialogHelper;

  bool isAnyDialogShowing = false;

  @override
  void initState() {
    super.initState();

    dialogHelper = DialogHelper(context);
  }

  void showProgressDialog(String message) {
    isAnyDialogShowing = true;

    dialogHelper.showProgressDialog(message, () {
      isAnyDialogShowing = false;
    });
  }

  void showErrorDialog(String message) {
    isAnyDialogShowing = true;

    dialogHelper.showSuccessfulOrErrorDialog("Oops!", message, "Dismiss", true,
            () {
          isAnyDialogShowing = false;
        });
  }

  void dismissAllDialogs() {
    if (isAnyDialogShowing) {

      isAnyDialogShowing = false;

      Navigator.pop(context);
    }
  }

  Widget paymentOptionsWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        PaymentButtonWidget(
          icon: Icons.credit_card,
          title: "Pay Using Card",
          onPressed: () {
            _stripeService.makePayment(
              widget.preOrder.totalPriceAtCheckout,
              () {
                debugPrint("Payment Success on Payment Screen");
              }, () {
                debugPrint("Payment Failure on Payment Screen");
                showErrorDialog("Payment Failed. Please try again.");
              },
            );
          },
        ),

        const SizedBox(
          height: appPadding * 1.5,
        ),

        PaymentButtonWidget(
          icon: Icons.delivery_dining_outlined,
          title: "Pay On Delivery",
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Column(
            children: [

              const SimpleHeader(title: "Checkout"),

              const SizedBox(
                height: appPadding,
              ),

              Divider(
                color: blackColor,
              ),

              const SizedBox(
                height: appPadding * 2,
              ),

              paymentOptionsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
