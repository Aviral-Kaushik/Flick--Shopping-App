import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flick/features/product/models/ui_related_product_ratings.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductRatingsWidget extends StatelessWidget {
  const ProductRatingsWidget(
      {super.key,
      required this.context,
      required this.uiRelatedProductRatings});

  final BuildContext context;
  final UIRelatedProductRatings uiRelatedProductRatings;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        avgRatingStarsAndNumberOfReviewLayout(),

        const SizedBox(width: appPadding,),

        numberWiseReviewDistributionLayout(),
      ],
    );
  }

  avgRatingStarsAndNumberOfReviewLayout() {
    return Column(
      children: [
        Text(
          (uiRelatedProductRatings.productRatings.avgRating ?? 0.0).toStringAsFixed(1),
          style: GoogleFonts.poppins(
              color: blackColor,
              fontSize: 70,
              fontWeight: FontWeight.bold),
        ),

        RatingBar.readOnly(
          filledIcon: Icons.star,
          emptyIcon: Icons.star_border,
          initialRating: uiRelatedProductRatings.productRatings.avgRating!,
          maxRating: 5,
          isHalfAllowed: true,
          size: 20,
          halfFilledIcon: Icons.star_half,
        ),

        const SizedBox(height: appPadding / 2,),

        Text(
          uiRelatedProductRatings.productRatings.totalNumberOfRating.toString(),
          style: GoogleFonts.montserrat(
            color: blackColor,
            fontSize: 14,),
        ),
      ],
    );
  }

  numberWiseReviewDistributionLayout() {
    var data = {1: 1, 2: 1, 3: 0, 4: 1, 5: 0};
    return Flexible(
      child: ListView.builder(
        reverse: true,
        shrinkWrap: true, // Make it shrink-wrap so it takes minimal vertical space
        physics: const NeverScrollableScrollPhysics(), // Disable scrolling
        itemCount: 5,

        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: appPadding / 4),
            child: Row(
              children: [
                // Fixed width for the text
                SizedBox(
                  width: 20,
                  child: Text(
                    (index + 1).toString(),
                    style: GoogleFonts.montserrat(
                      color: blackColor,
                      fontSize: 12,
                    ),
                  ),
                ),

                const SizedBox(width: appPadding / 4,),

                // Expanded to take up remaining space for the progress bar
                Expanded(
                  child: SizedBox(
                    height: 15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(appPadding),
                      child: LinearProgressIndicator(
                        value: (uiRelatedProductRatings.numberWiseReviewData[index + 1] ?? 0) /
                            (uiRelatedProductRatings.productRatings.totalNumberOfRating ?? 1),
                        backgroundColor: const Color(0xFFE1E1E1),
                        color: Colors.blueAccent,
                        valueColor: const AlwaysStoppedAnimation(Colors.blueAccent),
                        minHeight: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // numberWiseReviewDistributionLayout() {
  //   return ConstrainedBox(
  //     constraints: BoxConstraints(
  //       maxWidth: MediaQuery.of(context).size.width, // Constrain width to the device screen width
  //     ),
  //     child: ListView.builder(
  //       shrinkWrap: true,
  //       physics: const NeverScrollableScrollPhysics(), // Disable scrolling
  //       itemCount: 5,
  //       itemBuilder: (context, index) {
  //         return Padding(
  //           padding: const EdgeInsets.symmetric(vertical: appPadding / 4), // Padding for spacing between rows
  //           child: Row(
  //             children: [
  //               // Constraining the width of the Text widget
  //               SizedBox(
  //                 width: 20, // Assign a fixed width for the index Text
  //                 child: Text(
  //                   index.toString(),
  //                   style: GoogleFonts.montserrat(
  //                     color: blackColor,
  //                     fontSize: 12,
  //                   ),
  //                 ),
  //               ),
  //
  //               const SizedBox(width: appPadding / 4,),
  //
  //               // Wrap the progress bar inside Expanded so it takes remaining space
  //               Expanded(
  //                 child: SizedBox(
  //                   height: 18,
  //                   child: ClipRRect(
  //                     borderRadius: BorderRadius.circular(appPadding), // Rounded corners
  //                     child: LinearProgressIndicator(
  //                       value: (uiRelatedProductRatings.numberWiseReviewData[index] ?? 0) /
  //                           (uiRelatedProductRatings.productRatings.totalNumberOfRating ?? 1), // Avoid division by zero
  //                       backgroundColor: Colors.grey,
  //                       color: Colors.blueAccent,
  //                       valueColor: const AlwaysStoppedAnimation(Colors.blueAccent),
  //                       minHeight: 18,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
