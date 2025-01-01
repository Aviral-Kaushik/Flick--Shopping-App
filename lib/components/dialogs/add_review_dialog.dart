import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class AddReviewDialog extends StatelessWidget {
  AddReviewDialog({super.key, required this.onReviewAndRatingSubmitted});

  final Function(int rating, String review) onReviewAndRatingSubmitted;

  final TextEditingController reviewController = TextEditingController();

  double currentRating = 3;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(appPadding)
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      child: viewMessageDialogContent(context),
    );
  }

  viewMessageDialogContent(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(appPadding),

        decoration: BoxDecoration(
            color: whiteColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(appPadding),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0)
              )
            ]
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const SizedBox(
              height: appPadding,
            ),

            const Text("Write A Review", style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),),

            const SizedBox(
              height: appPadding,
            ),

            const Divider(color: Color(0xffdddddd),),

            const SizedBox(
              height: appPadding,
            ),

            Center(
              child: RatingBar(
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                onRatingChanged: (value) {
                  currentRating = value;
                },
                initialRating: 3,
                maxRating: 5,
                size: 40,
              ),
            ),

            const SizedBox(
              height: appPadding * 2,
            ),

            SingleChildScrollView(
              child: TextFormField(
                minLines: 5,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: reviewController,

                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.blueAccent
                      )
                  ),

                  hintText: "Write A Review",
                  // TODO Add functionality for showing error
                  // errorText: "Invalid Message"
                ),
              ),
            ),

            const SizedBox(
              height: appPadding * 2,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                child: GestureDetector(
                  onTap: () {
                    onReviewAndRatingSubmitted(
                        currentRating.toInt(), reviewController.text);
                    Navigator.pop(context);
                  },

                  child: Container(
                    padding: const EdgeInsets.all(appPadding / 2),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(appPadding)
                    ),

                    child: Center(
                      child: Text("Submit Review", style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                      ),),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: appPadding / 2,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.all(appPadding / 2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(appPadding)
                    ),
                    child: const Center(
                      child: Text("Dismiss", style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                      ),),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
