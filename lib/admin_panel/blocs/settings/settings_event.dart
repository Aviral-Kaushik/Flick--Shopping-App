import 'package:flick/models/User.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class FetchAllAdmins extends SettingsEvent {
  const FetchAllAdmins();
}

class CreateNewAdmin extends SettingsEvent {
  final String mail;

  const CreateNewAdmin(this.mail);
}

class DeleteAdmin extends SettingsEvent {
  final User user;

  const DeleteAdmin(this.user);
}


class SearchAdmin extends SettingsEvent {
  final String query;

  const SearchAdmin(this.query);
}