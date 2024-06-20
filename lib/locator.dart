import 'package:flick/admin_panel/blocs/messages/messages_bloc.dart';
import 'package:flick/admin_panel/blocs/termsAndPrivacy/terms_and_privacy_bloc.dart';
import 'package:flick/admin_panel/repositories/messages_repository.dart';
import 'package:flick/admin_panel/repositories/terms_and_privacy_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<TermsAndPrivacyRepository>(
      () => TermsAndPrivacyRepository());

  locator.registerLazySingleton<TermsAndPrivacyBloc>(
      () => TermsAndPrivacyBloc(TermsAndPrivacyRepository()));
  locator.registerLazySingleton<MessagesBloc>(
      () => MessagesBloc(MessageRepository()));
}
