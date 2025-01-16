import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flick/components/increment_and_decrement_widget.dart';
import 'package:flick/models/order_product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSummaryCard extends StatefulWidget {
  const OrderSummaryCard({
    super.key,
    required this.orderProduct,
    this.cartConfigurations});

  final OrderProduct orderProduct;
  final CartConfigurationsForSummaryCard? cartConfigurations;

  @override
  State<OrderSummaryCard> createState() => _OrderSummaryCardState();
}

class _OrderSummaryCardState extends State<OrderSummaryCard> {

  Widget boldAndSimpleRowTextWidget(String boldText, String simpleText) {
    return Text.rich(
      TextSpan(
        children: [

          TextSpan(
            text: boldText,
            style: GoogleFonts.lato(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,),
          ),

          TextSpan(
            text: simpleText,
            style: GoogleFonts.lato(
                color: textColor,
                fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget quantityIncrementAndDecrementWidget() {
    return IncrementAndDecrementWidget(
        selectedQuantity: widget.orderProduct.quantity,
        textSize: widget.cartConfigurations!.textSize,
        iconSize: widget.cartConfigurations!.iconSize,
        onIncrementPressed: () {
          if (widget.cartConfigurations != null) {
            widget.cartConfigurations!.onIncrementPressed!();
          }
        },
        onDecrementPressed: () {
          if (widget.cartConfigurations != null) {
            widget.cartConfigurations!.onDecrementPressed!();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
      child: Container(

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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),

                  child: Image.asset(widget.orderProduct.productImages[0],
                      width: 100, height: 100, fit: BoxFit.cover),
                ),

                const SizedBox(width: appPadding),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(widget.orderProduct.productName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.lato(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),

                    const SizedBox(height: appPadding / 2),

                    if (widget.cartConfigurations == null)
                      boldAndSimpleRowTextWidget(
                          "Quantity: ", widget.orderProduct.quantity.toString())
                    else
                      quantityIncrementAndDecrementWidget(),

                    const SizedBox(height: appPadding / 2),

                    RatingBar.readOnly(
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      initialRating: widget.orderProduct.productRating,
                      maxRating: 5,
                      isHalfAllowed: true,
                      size: 20,
                      halfFilledIcon: Icons.star_half,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: appPadding,),

            boldAndSimpleRowTextWidget(
                "Price: ₹", widget.orderProduct.productPrice.toString()),
          ],
        ),
      ),
    );
  }
}

class CartConfigurationsForSummaryCard {

  final double? textSize;
  final double? iconSize;
  final Function()? onIncrementPressed;
  final Function()? onDecrementPressed;

  const CartConfigurationsForSummaryCard({
    this.textSize,
    this.iconSize,
    this.onIncrementPressed,
    this.onDecrementPressed,
  });
}
