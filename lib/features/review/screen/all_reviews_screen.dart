import 'package:flick/components/user_review_card.dart';
import 'package:flick/features/review/widgets/all_reviews_header.dart';
import 'package:flick/models/rating.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class AllReviewsScreen extends StatelessWidget {
  const AllReviewsScreen({super.key, required this.ratings});

  final List<Rating> ratings;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(appPadding),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                AllReviewsHeader(backButtonPressed: () {
                  Navigator.pop(context);
                },),

                const SizedBox(height: appPadding,),

                ListView.builder(
                  shrinkWrap: true, // Make it shrink-wrap so it takes minimal vertical space
                  physics: const BouncingScrollPhysics(),
                  itemCount: ratings.length,
                  itemBuilder: (context, index) => UserReviewCard(rating: ratings[index]),
                  padding: const EdgeInsets.symmetric(vertical: appPadding / 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
