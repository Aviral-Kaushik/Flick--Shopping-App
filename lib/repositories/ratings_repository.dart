import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/features/product/models/ui_related_product_ratings.dart';
import 'package:flick/models/product_ratings.dart';
import 'package:flick/models/rating.dart';
import 'package:flick/services/firebase_services.dart';
import 'package:flick/utils/mapper.dart';
import 'package:tuple/tuple.dart';

class RatingsRepository {
  final FirebaseServices firebaseServices;

  RatingsRepository(this.firebaseServices);

  Future<UIRelatedProductRatings> fetchProductRatings(String productId) async {
    List<Rating> ratings = getDummyRatingList3();
    int sumOfAllRatings = 1;

    for (Rating rating in ratings) {
      sumOfAllRatings += rating.rating;
    }

    double avgRating = sumOfAllRatings / ratings.length;

    var productRatings = ProductRatings(
        productId: productId,
        avgRating: avgRating,
        totalNumberOfRating: ratings.length,
        ratings: ratings);

    return mapProductRatingsToUIRelatedProductRatings(productRatings);
  }

  Future<Tuple2<bool, String>> addNewProductRating(String productId, Rating rating) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    return Tuple2(hasErrorOccurred, errorMessage);
  }

}