import 'package:flick/utils/global_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  SharedPreferences? prefs;

  SessionManager() {
    init();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void storeUsernameInSessionStorage(String username)  {
    prefs?.setString(sessionUsernameKey, username);
  }

  String? getUsername() {
    return prefs?.getString(sessionUsernameKey);
  }
}