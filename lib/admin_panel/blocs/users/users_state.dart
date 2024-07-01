import 'package:flick/models/User.dart';

abstract class UsersState {
  const UsersState();
}

class UsersStateInitial extends UsersState {}

class UserLoading extends UsersState {
  final String progressMessage;

  const UserLoading(this.progressMessage);
}

class FetchedAllUsers extends UsersState {
  final List<User> users;

  const FetchedAllUsers(this.users);
}

class UsersError extends UsersState {
  final String errorMessage;

  const UsersError(this.errorMessage);
}

class UserEditedSuccessfully extends UsersState {
  const UserEditedSuccessfully();
}
