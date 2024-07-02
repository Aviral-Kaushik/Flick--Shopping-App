import 'package:flick/admin_panel/helper/UserFilter.dart';
import 'package:flick/models/User.dart';
import 'package:tuple/tuple.dart';

class UsersRepository {

  late List<User> users;

  Future<Tuple3<List<User>, bool, String>> fetchAllUsers() async {
    List<User> users = List.empty();
    bool hasErrorOccurred = false;
    String errorMessage = "";

    return Tuple3(users, hasErrorOccurred, errorMessage);
  }

  Future<List<User>> searchUsers(String query) async {
    return List.empty();
  }

  Future<Tuple2<bool, String>> editUser(User user) async {
    bool isUserUpdatedSuccessfully = true;
    String errorMessage = "";

    return Tuple2(isUserUpdatedSuccessfully, errorMessage);
  }

  Future<List<User>> applyUserFilter(UserFilter userFilter) async {
    return List.empty();
  }

  Future<Tuple2<bool, String>> deleteUser(User user) async {
    bool isUserDeletedSuccessfully = false;
    String errorMessage = "Firebase Exception";

    return Tuple2(isUserDeletedSuccessfully, errorMessage);
  }
}
