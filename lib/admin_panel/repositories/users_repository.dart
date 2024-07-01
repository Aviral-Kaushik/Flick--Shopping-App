import 'package:flick/admin_panel/helper/UserFilter.dart';
import 'package:flick/models/User.dart';

class UsersRepository {

  late List<User> users;

  Future<List<User>> fetchAllUsers() async {
    return List.empty();
  }

  Future<List<User>> searchUsers(String query) async {
    return List.empty();
  }

  Future<bool> editUser(User user) async {
    return true;
  }

  Future<List<User>> applyUserFilter(UserFilter userFilter) async {
    return List.empty();
  }
}
