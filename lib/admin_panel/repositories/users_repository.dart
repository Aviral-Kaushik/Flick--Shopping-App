import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/admin_panel/helper/UserFilter.dart';
import 'package:flick/models/User.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';

class UsersRepository {

  late List<User> users;

  Future<Tuple3<List<User>, bool, String>> fetchAllUsers() async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    users = getUsersData();

    return Tuple3(users, hasErrorOccurred, errorMessage);
  }

  Future<List<User>> searchUsers(String query) async {
    if (query == "" || query.isEmpty) {
      return users;
    }

    RegExp regExp = RegExp(
        query,
        caseSensitive: false
    );

    List<User> filteredUser = users
        .where((user) =>
            regExp.hasMatch(user.name) ||
            regExp.hasMatch(user.email) ||
            regExp.hasMatch(user.email) ||
            regExp.hasMatch(user.country))
        .toSet()
        .toList();

    return filteredUser;
  }

  Future<Tuple2<bool, String>> editUser(User user) async {
    bool isUserUpdatedSuccessfully = true;
    String errorMessage = "";

    if (!users.contains(user)) {
        isUserUpdatedSuccessfully = false;
        errorMessage = "User not exists";
        return Tuple2(isUserUpdatedSuccessfully, errorMessage);
    }
    
    users[users.indexWhere((element) => element.id == user.id)] = user;
    
    return Tuple2(isUserUpdatedSuccessfully, errorMessage);
  }

  Future<Tuple3<List<User>, bool, String>> applyUserFilter(UserFilter userFilter) async {
    bool errorOccurred = false;
    String errorMessage = "";

    print("Aviral UserFilter: ");
    print("Aviral FilterName: ${userFilter.filterName}");
    print("Aviral filterInAscendingOrder: ${userFilter.filterInAscendingOrder}");

    String filterName = userFilter.filterName;
    bool filterUserInAscendingOrder = userFilter.filterInAscendingOrder;

    List<User> filteredUsers = users;

    if (filterName == "A to Z") {
      filteredUsers.sort((a, b) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      });

      print("Aviral sort list size: ${filteredUsers.length}");

      if (!filterUserInAscendingOrder) {
        filteredUsers = filteredUsers.reversed.toList();
      }

    } else if (filterName == "Date Created") {
        filteredUsers.sort((a, b) {
          DateFormat dateFormat = DateFormat('MM-dd-yyyy');

          DateTime dateTime1 = dateFormat.parse(a.joiningDate);
          DateTime dateTime2 = dateFormat.parse(b.joiningDate);

          return dateTime1.compareTo(dateTime2);
        });

        if (!filterUserInAscendingOrder) {
          filteredUsers = filteredUsers.reversed.toList();
        }

    } else {

      errorOccurred = true;
      errorMessage = "Invalid Filter";
      return Tuple3(filteredUsers, errorOccurred, errorMessage);

    }

    return Tuple3(filteredUsers, errorOccurred, errorMessage);
  }

  Future<Tuple2<bool, String>> deleteUser(User user) async {
    bool isUserDeletedSuccessfully = false;
    String errorMessage = "Firebase Exception";

    bool isDeletionSuccessful = users.remove(user);

    if (isDeletionSuccessful) {
        isUserDeletedSuccessfully = true;
        errorMessage = "";
    } else {
        isUserDeletedSuccessfully = false;
        errorMessage = "Firebase Exception";
    }

    return Tuple2(isUserDeletedSuccessfully, errorMessage);
  }
}
