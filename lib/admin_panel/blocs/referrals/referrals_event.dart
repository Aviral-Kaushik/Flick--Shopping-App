abstract class ReferralsEvent {

  const ReferralsEvent();
}

class FetchReferralMessageAndData extends ReferralsEvent {

  const FetchReferralMessageAndData();
}

class UpdateReferralMessage extends ReferralsEvent {
  final String referralMessage;

  const UpdateReferralMessage(this.referralMessage);
}