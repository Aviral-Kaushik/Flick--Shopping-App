import 'package:flick/admin_panel/blocs/dashboard/dashboard_bloc.dart';
import 'package:flick/admin_panel/blocs/messages/messages_bloc.dart';
import 'package:flick/admin_panel/blocs/referrals/referrals_bloc.dart';
import 'package:flick/admin_panel/blocs/settings/settings_bloc.dart';
import 'package:flick/admin_panel/blocs/termsAndPrivacy/terms_and_privacy_bloc.dart';
import 'package:flick/admin_panel/blocs/users/users_bloc.dart';
import 'package:flick/admin_panel/repositories/dashboard_repository.dart';
import 'package:flick/admin_panel/repositories/messages_repository.dart';
import 'package:flick/admin_panel/repositories/referrals_repository.dart';
import 'package:flick/admin_panel/repositories/settings_repository.dart';
import 'package:flick/admin_panel/repositories/terms_and_privacy_repository.dart';
import 'package:flick/admin_panel/repositories/users_repository.dart';
import 'package:flick/admin_panel/services/firebase_services.dart';
import 'package:flick/data/database/hive_database.dart';
import 'package:flick/data/session/session_manager.dart';
import 'package:flick/features/address/blocs/add_edit_address_boc/add_edit_address_bloc.dart';
import 'package:flick/features/address/blocs/address_bloc/address_bloc.dart';
import 'package:flick/helper/MailHelper.dart';
import 'package:flick/repositories/address_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<FirebaseServices>(() => FirebaseServices());
  locator.registerLazySingleton<MailHelper>(() => MailHelper());

  final firebaseServices = locator.get<FirebaseServices>();

  locator.registerLazySingleton<HiveDatabase>(() => HiveDatabase());
  locator.registerLazySingleton<SessionManager>(() => SessionManager());

  // Get it initialization for Admin Panel Blocs
  locator.registerLazySingleton<TermsAndPrivacyRepository>(
      () => TermsAndPrivacyRepository(firebaseServices));
  locator.registerLazySingleton<TermsAndPrivacyBloc>(
      () => TermsAndPrivacyBloc(TermsAndPrivacyRepository(firebaseServices)));
  locator.registerLazySingleton<MessagesBloc>(
      () => MessagesBloc(MessageRepository(firebaseServices)));
  locator.registerLazySingleton<SettingsBloc>(
      () => SettingsBloc(SettingsRepository(firebaseServices)));
  locator.registerLazySingleton<ReferralsBloc>(
      () => ReferralsBloc(ReferralsRepository(firebaseServices)));
  locator.registerLazySingleton<DashboardBloc>(
      () => DashboardBloc(DashboardRepository(firebaseServices)));
  locator.registerLazySingleton<UsersBloc>(
      () => UsersBloc(UsersRepository(firebaseServices)));

  locator.registerLazySingleton<AddressBloc>(
          () => AddressBloc(AddressRepository(firebaseServices)));
  locator.registerLazySingleton<AddEditAddressBloc>(
          () => AddEditAddressBloc(AddressRepository(firebaseServices)));
}
