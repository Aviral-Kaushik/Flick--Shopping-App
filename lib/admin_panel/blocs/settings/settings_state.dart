import 'package:flick/models/User.dart';

abstract class SettingsState {
  const SettingsState();
}

class SettingsInitial extends SettingsState {

}

class SettingsLoading extends SettingsState {
  final String progressMessage;

  const SettingsLoading(this.progressMessage);
}


class AdminFetched extends SettingsState {
  final List<User> admins;

  const AdminFetched(this.admins);
}

class SettingsError extends SettingsState {
  final String errorMessage;

  const SettingsError(this.errorMessage);
}

class NewAdminCreatedSuccessfully extends SettingsState {
  const NewAdminCreatedSuccessfully();
}

class AdminDeleteSuccessfully extends SettingsState {
  const AdminDeleteSuccessfully();
}