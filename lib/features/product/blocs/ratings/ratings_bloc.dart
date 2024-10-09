import 'package:flick/features/product/blocs/ratings/ratings_event.dart';
import 'package:flick/features/product/blocs/ratings/ratings_state.dart';
import 'package:flick/repositories/ratings_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingsBloc extends Bloc<RatingsEvent, RatingsState> {

  final RatingsRepository ratingsRepository;

  RatingsBloc(this.ratingsRepository) : super(RatingsInitial()) {
    on<FetchProductRating>((event, emit) {

    });

    on<AddNewProductRating>((event, emit) {

    });
  }
}