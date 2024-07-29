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

class FetchReferralMessage extends ReferralsEvent {

  const FetchReferralMessage();
}

class IncrementReferralCount extends ReferralsEvent {
  final String referralType;

  const IncrementReferralCount(this.referralType);
}