import 'package:flick/components/simple_button.dart';
import 'package:flick/features/order/components/order_summary_card.dart';
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
    return Container(
      padding: const EdgeInsets.all(appPadding),

      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1.5,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Total: ", style: GoogleFonts.lato(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),

              const SizedBox(width: 5,),

              Text(
                "₹${widget.preOrder.totalPriceAtCheckout}",
                style: GoogleFonts.lato(
                  color: textColor,
                  fontSize: 20,
                )
              ),
            ],
          ),

          const SizedBox(height: appPadding / 2,),

          SimpleButton(
              buttonText: "Proceed to Checkout",
              backgroundColor: Colors.black,
              onPressed: () {},
              textColor: whiteColor,
              borderColor: whiteColor
          ),
        ],
      ),
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

              confirmationScreenHeaderWidget(),

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
