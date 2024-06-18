import 'package:flick/admin_panel/blocs/termsAndPrivacy/terms_and_privacy_event.dart';
import 'package:flick/admin_panel/blocs/termsAndPrivacy/terms_and_privacy_state.dart';
import 'package:flick/admin_panel/repositories/terms_and_privacy_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndPrivacyBloc
    extends Bloc<TermsAndPrivacyEvent, TermsAndPrivacyState> {

  final TermsAndPrivacyRepository termsAndPrivacyRepository;

  TermsAndPrivacyBloc(this.termsAndPrivacyRepository)
      : super(TermsAndPrivacyInitial()) {
    on<FetchTermsOrPrivacyPolicy>(
        (event, emit) async {
          emit(TermsAndPrivacyLoading());

          final termsOrPrivacy = await termsAndPrivacyRepository
              .getTermsAndCondition(event.shouldFetchPrivacyPolicy);

          emit(TermsOrPrivacyPolicyFetched(termsOrPrivacy, event.shouldFetchPrivacyPolicy));
        }
    );
    on<UpdateTermsOrPrivacyPolicy>(
        (event, emit) async {
          emit(TermsAndPrivacyLoading());

          await termsAndPrivacyRepository.updateTermsOrPolicy(
              event.termsOrPrivacyPolicyToBeUpdated, event.shouldUpdatePrivacyPolicy);

          emit(const TermsOrPrivacyPolicyUpdated());
        }
    );
  }

}