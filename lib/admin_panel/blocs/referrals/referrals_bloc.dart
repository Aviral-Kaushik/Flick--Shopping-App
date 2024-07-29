import 'package:flick/admin_panel/blocs/referrals/referrals_event.dart';
import 'package:flick/admin_panel/blocs/referrals/referrals_state.dart';
import 'package:flick/admin_panel/repositories/referrals_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

class ReferralsBloc extends Bloc<ReferralsEvent, ReferralsState> {

  final ReferralsRepository referralsRepository;

  ReferralsBloc(this.referralsRepository) : super(ReferralsInitial()) {
    on<FetchReferralMessageAndData>((event, emit) async {
      emit(const ReferralsLoading("Please wait! Fetching Referrals Data"));

      final referralData = await referralsRepository.fetchReferralData();

      emit(ReferralsDataFetched(referralData));

    });

    on<UpdateReferralMessage>((event, emit) async {
      emit(const ReferralsLoading("Please wait! Updating Referrals Message"));

      Tuple2<bool, String> referralMessageUpdateResponse =
            await referralsRepository.updateReferralMessage(event.referralMessage);

      if (referralMessageUpdateResponse.item1) {
        emit(ReferralError(referralMessageUpdateResponse.item2));
        return;
      }

      emit(const ReferralsMessageUpdatedSuccessfully());

    });

    on<FetchReferralMessage>((event, emit) async {
      emit(const ReferralsLoading("Please Wait!"));

      final referralData = await referralsRepository.fetchReferralData();

      emit(ReferralMessageFetched(referralData.referralMessage));
    });

    on<IncrementReferralCount>((event, emit) async {
      referralsRepository.incrementReferralCount(event.referralType);
    });
  }

}