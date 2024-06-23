import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/helper/MailHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/User.dart';

class SettingsRepository {

  late List<User> admins;

  Future<List<User>> fetchAllAdmins() async {
    admins = getUsersData().where(
            (user) => user.isAdmin).toList();
    return admins;
  }

  Future<bool> createNewAdmin(String email) async {
    // TODO Update isAdmin to true in firebase skipping logic in static data store step

    MailHelper mailHelper = locator.get<MailHelper>();
    mailHelper.createSmtpServer();

    final mailResponse = await mailHelper.sendAdminAccessEmail(email);

    if (mailResponse.isMailSentSuccessfully) {
      return true;
    } else {
      return false;
    }
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