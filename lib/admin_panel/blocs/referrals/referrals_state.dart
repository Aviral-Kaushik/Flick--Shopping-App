import 'package:flick/admin_panel/models/referrals/ui_related_referral_data.dart';

abstract class ReferralsState {

  const ReferralsState();
}

class ReferralsInitial extends ReferralsState {

}

class ReferralsLoading extends ReferralsState {
  final String progressMessage;

  const ReferralsLoading(this.progressMessage);
}

class ReferralsDataFetched extends ReferralsState {
  final UIRelatedReferralData referralData;

  const ReferralsDataFetched(this.referralData);
}

class ReferralError extends ReferralsState {
  final String errorMessage;

  const ReferralError(this.errorMessage);
}

class ReferralsMessageUpdatedSuccessfully extends ReferralsState {

  const ReferralsMessageUpdatedSuccessfully();
}

