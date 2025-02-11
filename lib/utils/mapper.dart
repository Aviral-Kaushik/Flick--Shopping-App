import 'package:flick/features/product/models/ui_related_product_ratings.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/models/category_wise_products.dart';
import 'package:flick/models/rating.dart';
import 'package:flick/models/product_ratings.dart';

ProductRatings createNewProductRatingFromRating(
    String productId, Rating rating) {
  return ProductRatings(
      productId: productId,
      avgRating: rating.rating.toDouble(),
      totalNumberOfRating: 1,
      ratings: [rating]
  );
}

ProductRatings updateProductRatingData(ProductRatings productRatings, double updatedRating, Rating rating) {
  return ProductRatings(
    productId: productRatings.productId,
    avgRating: updatedRating,
    totalNumberOfRating: productRatings.totalNumberOfRating! + 1,
    ratings: List.from(productRatings.ratings ?? [])..add(rating),
  );
}

UIRelatedProductRatings mapProductRatingsToUIRelatedProductRatings(ProductRatings productRatings) {
  Map<int, int> numberWiseReferralData = {1:0, 2:0, 3:0, 4:0, 5:0};

  productRatings.ratings?.forEach((rating) {
    if (numberWiseReferralData.containsKey(rating.rating)) {
      numberWiseReferralData[rating.rating] = (numberWiseReferralData[rating.rating] ?? 0) + 1;
    }
  });

  return UIRelatedProductRatings(
      productRatings: productRatings,
      numberWiseReviewData: numberWiseReferralData);
}

CategoryWiseProducts getCategoryWiseProducts(List<Product> product) {
  List<Product> wearableProducts = [];
  List<Product> sportsProducts = [];
  List<Product> fitnessProducts = [];
  List<Product> laptopsProducts = [];

  for (var element in product) {
    if (element.productCategory == "Wearables") {
      wearableProducts.add(element);
    } else if (element.productCategory == "Sports") {
      sportsProducts.add(element);
    } else if (element.productCategory == "Fitness") {
      fitnessProducts.add(element);
    } else if (element.productCategory == "Laptops") {
      laptopsProducts.add(element);
    }
  }

  return CategoryWiseProducts(
    wearableProducts: wearableProducts,
    sportsProducts: sportsProducts,
    fitnessProducts: fitnessProducts,
    laptopsProducts: laptopsProducts,
  );
}