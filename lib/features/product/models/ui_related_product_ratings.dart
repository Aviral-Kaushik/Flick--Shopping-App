import 'package:flick/models/product_ratings.dart';

class UIRelatedProductRatings {

  UIRelatedProductRatings({
    required this.productRatings,
    required this.numberWiseReviewData,
  });

  final ProductRatings productRatings;
  final Map<int, int> numberWiseReviewData;

}