import 'package:flick/models/User.dart';

abstract class UsersEvent {
  const UsersEvent();
}

class FetchAllUsers extends UsersEvent {
  const FetchAllUsers();
}

class SearchUser extends UsersEvent {
  final String searchQuery;

  const SearchUser(this.searchQuery);
}

class EditUser extends UsersEvent {
  final User userToBeEdited;

  const EditUser(this.userToBeEdited);
}
