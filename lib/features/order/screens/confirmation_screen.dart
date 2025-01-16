import 'package:flick/components/checkout_bottom_card.dart';
import 'package:flick/components/simple_header.dart';
import 'package:flick/components/order_summary_card.dart';
import 'package:flick/models/pre_order.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({
    super.key,
    required this.preOrder});

  final PreOrder preOrder;

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {

  Widget confirmationScreenHeaderWidget() {
    return Row(
      children: [

        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.all(appPadding / 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(appPadding / 2),
                border: Border.all(color: Colors.black)
            ),
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20,),
          ),
        ),

        const SizedBox(
          width: appPadding * 2,
        ),

        Text("Order Summary", style: GoogleFonts.lato(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 17
        ),)

      ]
    );
  }

  Widget getCheckoutBottomCard() {
    return CheckoutBottomCard(
        checkoutButtonText: "Proceed to Checkout",
        totalPrice: widget.preOrder.totalPriceAtCheckout.toString(),
        onCheckoutButtonPressed: () {
          Navigator.pushReplacementNamed(context, "/paymentScreen",
              arguments: {'preOrder': widget.preOrder});
        }
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

              const SimpleHeader(title: "Order Summary"),

              const SizedBox(
                height: appPadding,
              ),

              Divider(
                color: blackColor,
              ),

              const SizedBox(
                height: appPadding,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.67,
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.preOrder.orderProducts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => OrderSummaryCard(
                        orderProduct: widget.preOrder.orderProducts[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: appPadding,
                        )
                ),
              ),

              const Spacer(),

              Divider(
                color: blackColor,
              ),

              getCheckoutBottomCard()
            ],
          ),
        ),
      ),
    );
  }
}
