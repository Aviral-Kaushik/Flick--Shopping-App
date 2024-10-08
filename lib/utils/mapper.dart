import 'package:flick/models/rating.dart';
import 'package:flick/models/product_ratings.dart';

ProductRatings createNewProductRatingFromRating(
    String productId, Rating rating) {
  return ProductRatings(
      productId: productId,
      avgRating: rating.rating,
      totalNumberOfRating: 1,
      ratings: [rating]
  );
}

ProductRatings updateProductRatingData(ProductRatings productRatings, double updatedRating, Rating rating) {
  return ProductRatings(
    productId: productRatings.productId,
    avgRating: updatedRating.toInt(),
    totalNumberOfRating: productRatings.totalNumberOfRating! + 1,
    ratings: List.from(productRatings.ratings ?? [])..add(rating),
  );
}