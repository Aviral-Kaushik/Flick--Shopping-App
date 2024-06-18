abstract class TermsAndPrivacyState {
  const TermsAndPrivacyState();
}

class TermsAndPrivacyInitial extends TermsAndPrivacyState {

}

class TermsAndPrivacyLoading extends TermsAndPrivacyState {

}

class TermsOrPrivacyPolicyFetched extends TermsAndPrivacyState {
  final String termsAndPrivacy;
  final bool isPrivacyPolicy;

  const TermsOrPrivacyPolicyFetched(this.termsAndPrivacy, this.isPrivacyPolicy);
}

class TermsOrPrivacyPolicyUpdated extends TermsAndPrivacyState {

  const TermsOrPrivacyPolicyUpdated();
}

class TermsOrPrivacyPolicyUpdateFailed extends TermsAndPrivacyState {
  final String errorMessage;

  const TermsOrPrivacyPolicyUpdateFailed(this.errorMessage);
}