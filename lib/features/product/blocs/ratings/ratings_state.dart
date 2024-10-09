import 'package:flick/features/product/models/ui_related_product_ratings.dart';
import 'package:flick/models/product_ratings.dart';

abstract class RatingsState {

  const RatingsState();
}

class RatingsInitial extends RatingsState {

}

class RatingsProgress extends RatingsState {
  final String progressMessage;

  const RatingsProgress(this.progressMessage);
}

class ProductRatingsFetched extends RatingsState {
  final UIRelatedProductRatings productRatings;

  const ProductRatingsFetched(this.productRatings);
}

class RatingsError extends RatingsState {
  final String errorMessage;

  const RatingsError(this.errorMessage);
}

class NewRatingsAddedSuccessfully extends RatingsState {

  const NewRatingsAddedSuccessfully();
}