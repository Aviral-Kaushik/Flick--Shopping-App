import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/models/User.dart';

class DashboardRepository {

  Future<List<User>> fetchUsers() async {
    return getUsersData();
  }

}