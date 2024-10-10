import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flick/features/product/models/ui_related_product_ratings.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flick/widgets/user_review_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductRatingsWidget extends StatelessWidget {
  const ProductRatingsWidget(
      {super.key,
      required this.context,
      required this.uiRelatedProductRatings,
      required this.onSeeAllReviewsButtonInteraction});

  final BuildContext context;
  final UIRelatedProductRatings uiRelatedProductRatings;
  final Function() onSeeAllReviewsButtonInteraction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            avgRatingStarsAndNumberOfReviewLayout(),

            const SizedBox(width: appPadding,),

            numberWiseReviewDistributionLayout(),
          ],
        ),

        const SizedBox(width: appPadding * 2,),

        show3ReviewsListView(),

        const SizedBox(width: appPadding * 3,),

        ratingsAndReviewsSectionActionButtonWidget(),
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

  show3ReviewsListView() {
    return ListView.builder(
        shrinkWrap: true, // Make it shrink-wrap so it takes minimal vertical space
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          if (uiRelatedProductRatings.productRatings.ratings != null &&
              index < uiRelatedProductRatings.productRatings.ratings!.length) {
            return UserReviewCard(rating: uiRelatedProductRatings.productRatings.ratings![index]);
          } else {
            return const SizedBox.shrink();
          }
        },
      padding: const EdgeInsets.symmetric(vertical: appPadding / 2),
    );
  }

  ratingsAndReviewsSectionActionButtonWidget() {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onSeeAllReviewsButtonInteraction,
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Center(
                child: Text(
                  "See all reviews",
                  style: TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
