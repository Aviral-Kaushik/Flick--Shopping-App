import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/models/User.dart';

class SettingsRepository {

  late List<User> admins;

  Future<List<User>> fetchAllAdmins() async {
    admins = getUsersData();
    return admins.where((user) => user.isAdmin).toList();
  }

  Future<bool> createNewAdmin(String email) async {
    return true;
  }

  Future<bool> deleteAdmin(User user) async {
    return admins.remove(user);
  }

  Future<List<User>> searchAdmin(String query) async {
    if (query == "" || query.isEmpty) {
      return admins;
    }

    RegExp regex = RegExp(
      query,
      caseSensitive: false
    );

    List<User> filteredAdminList = admins
        .where((user) =>
            regex.hasMatch(user.name) ||
            regex.hasMatch(user.username) ||
            regex.hasMatch(user.email) ||
            regex.hasMatch(user.country))
        .toSet()
        .toList();

    return filteredAdminList;
  }

}