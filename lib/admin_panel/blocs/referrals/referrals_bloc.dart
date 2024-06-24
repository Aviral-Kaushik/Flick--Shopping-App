import 'package:flick/admin_panel/blocs/referrals/referrals_event.dart';
import 'package:flick/admin_panel/blocs/referrals/referrals_state.dart';
import 'package:flick/admin_panel/repositories/referrals_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

      final isReferralMessageUpdatedSuccessfully =
            await referralsRepository.updateReferralMessage(event.referralMessage);

      if (isReferralMessageUpdatedSuccessfully) {

        emit(const ReferralsMessageUpdatedSuccessfully());

      } else {

        emit(const ReferralError("Cannot load referral data at this moment!"));
        
      }

    });
  }

}