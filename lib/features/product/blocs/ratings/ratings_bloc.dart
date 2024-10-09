import 'package:flick/features/product/blocs/ratings/ratings_event.dart';
import 'package:flick/features/product/blocs/ratings/ratings_state.dart';
import 'package:flick/features/product/models/ui_related_product_ratings.dart';
import 'package:flick/models/product_ratings.dart';
import 'package:flick/repositories/ratings_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

class RatingsBloc extends Bloc<RatingsEvent, RatingsState> {

  final RatingsRepository ratingsRepository;

  RatingsBloc(this.ratingsRepository) : super(RatingsInitial()) {
    on<FetchProductRating>((event, emit) async {
      emit(const RatingsProgress("Please Wait! Fetching Product Details"));

      UIRelatedProductRatings productRatings = await ratingsRepository.fetchProductRatings(event.productId);

      emit(ProductRatingsFetched(productRatings));
    });

    on<AddNewProductRating>((event, emit) async {
      emit(const RatingsProgress("Please Wait! Adding Product Review"));

      Tuple2<bool, String> productRatingResponse = await ratingsRepository
          .addNewProductRating(event.productId, event.rating);

      if (productRatingResponse.item1) {
        emit(RatingsError(productRatingResponse.item2));
        return;
      }

      emit(const NewRatingsAddedSuccessfully());
    });
  }
}