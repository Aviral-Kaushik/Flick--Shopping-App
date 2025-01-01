import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flick/models/rating.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key, required this.rating});

  final Rating rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(appPadding),
      margin: const EdgeInsets.symmetric(vertical: appPadding / 2),

      decoration: BoxDecoration(
        color: whiteColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(
          appPadding / 2
        ),

          boxShadow: const [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              CircleAvatar(
                radius: appPadding,
                backgroundColor: Colors.orangeAccent,
                child: Text(rating.username.substring(0, 1), style: TextStyle(
                  color: whiteColor
                ),),
              ),

              const SizedBox(width: appPadding / 2,),

              Text(
                rating.username,
                style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),

          const SizedBox(height: appPadding / 2,),

          RatingBar.readOnly(
            filledIcon: Icons.star,
            emptyIcon: Icons.star_border,
            initialRating: rating.rating.toDouble(),
            maxRating: 5,
            isHalfAllowed: true,
            size: 20,
            halfFilledIcon: Icons.star_half,
          ),

          const SizedBox(height: appPadding / 1.5,),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: appPadding),
            child: Text(
              rating.ratingComment,
              style: GoogleFonts.poppins(
                  color: blackColor,
                  fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
