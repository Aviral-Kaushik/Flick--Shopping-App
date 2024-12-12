import 'package:flick/admin_panel/helper/user_product_filter.dart';
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

class ApplyFilter extends UsersEvent {
  final UserProductFilter userFilter;

  const ApplyFilter(this.userFilter);
}

class DeleteUser extends UsersEvent {
  final User user;

  const DeleteUser(this.user);
}
