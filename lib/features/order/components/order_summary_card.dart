import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flick/models/order_product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    super.key,
    required this.orderProduct});

  final OrderProduct orderProduct;

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

                  child: Image.asset(orderProduct.productImages[0],
                      width: 100, height: 100, fit: BoxFit.cover),
                ),

                const SizedBox(width: appPadding),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(orderProduct.productName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.lato(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),

                    const SizedBox(height: appPadding / 2),

                    boldAndSimpleRowTextWidget(
                        "Quantity: ", orderProduct.quantity.toString()),

                    const SizedBox(height: appPadding / 2),

                    RatingBar.readOnly(
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      initialRating: orderProduct.productRating,
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
                "Price: ₹", orderProduct.productPrice.toString()),
          ],
        ),
      ),
    );
  }
}
