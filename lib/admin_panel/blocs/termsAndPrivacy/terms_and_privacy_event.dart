abstract class TermsAndPrivacyEvent {
  const TermsAndPrivacyEvent();
}

class FetchTermsOrPrivacyPolicy extends TermsAndPrivacyEvent {
  final bool shouldFetchPrivacyPolicy;

  const FetchTermsOrPrivacyPolicy(this.shouldFetchPrivacyPolicy);
}

class UpdateTermsOrPrivacyPolicy extends TermsAndPrivacyEvent {
  final String termsOrPrivacyPolicyToBeUpdated;
  final bool shouldUpdatePrivacyPolicy;

  UpdateTermsOrPrivacyPolicy(
      this.termsOrPrivacyPolicyToBeUpdated, this.shouldUpdatePrivacyPolicy);
}