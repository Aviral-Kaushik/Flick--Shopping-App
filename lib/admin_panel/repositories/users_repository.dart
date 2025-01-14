import 'package:flick/admin_panel/helper/user_product_filter.dart';
import 'package:flick/services/firebase_services.dart';
import 'package:flick/models/User.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';

class UsersRepository {
  late List<User> users;

  FirebaseServices firebaseServices;

  UsersRepository(this.firebaseServices);

  Future<Tuple3<List<User>, bool, String>> fetchAllUsers() async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    users = await firebaseServices.fetchAllUsers();

    return Tuple3(users, hasErrorOccurred, errorMessage);
    // users = getUsersData();
    // firebaseServices.storeAllUsersData(users);
  }

  Future<List<User>> searchUsers(String query) async {
    if (query == "" || query.isEmpty) {
      return users;
    }

    RegExp regExp = RegExp(query, caseSensitive: false);

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
    Tuple2<bool, String> updateUserResponse =
        await firebaseServices.updateUser(user);

    return updateUserResponse;
  }

  Future<Tuple3<List<User>, bool, String>> applyUserFilter(
      UserProductFilter userFilter) async {
    bool errorOccurred = false;
    String errorMessage = "";

    String filterName = userFilter.filterName;
    bool filterUserInAscendingOrder = userFilter.filterInAscendingOrder;

    List<User> filteredUsers = users;

    if (filterName == "A to Z") {
      filteredUsers.sort((a, b) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      });

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
    bool hasErrorOccurred = false;
    String errorMessage = "Firebase Exception";

    Tuple2<bool, String> deleteUserResponse =
        await firebaseServices.deleteUser(user);

    if (deleteUserResponse.item1) {
      hasErrorOccurred = true;
      errorMessage = "Firebase Exception";
    } else {
      hasErrorOccurred = false;
      errorMessage = "";
    }

    return Tuple2(hasErrorOccurred, errorMessage);
  }
}
