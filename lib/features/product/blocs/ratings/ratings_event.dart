import 'package:flick/models/rating.dart';

abstract class RatingsEvent {

  const RatingsEvent();
}

class FetchProductRating extends RatingsEvent {
  final String productId;

  const FetchProductRating(this.productId);
}

class AddNewProductRating extends RatingsEvent {
  final Rating rating;
  final String productId;

  const AddNewProductRating(this.rating, this.productId);
}