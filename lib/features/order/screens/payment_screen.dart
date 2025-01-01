import 'package:flick/components/simple_header.dart';
import 'package:flick/features/order/components/payment_button_widget.dart';
import 'package:flick/models/pre_order.dart';
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

  Widget paymentOptionsWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        PaymentButtonWidget(
          icon: Icons.credit_card,
          title: "Pay Using Card",
          onPressed: () {},
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
