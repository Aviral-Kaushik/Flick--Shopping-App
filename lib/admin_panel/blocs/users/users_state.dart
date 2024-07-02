import 'package:flick/models/User.dart';

abstract class UsersState {
  const UsersState();
}

class UsersStateInitial extends UsersState {}

class UsersLoading extends UsersState {
  final String progressMessage;

  const UsersLoading(this.progressMessage);
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

class UserDeletedSuccessfully extends UsersState {
  const UserDeletedSuccessfully();
}
