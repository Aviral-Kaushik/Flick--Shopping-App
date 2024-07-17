import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/admin_panel/models/DetailsCardModel.dart';
import 'package:flick/admin_panel/models/dashboard/DashboardRepositoryResponse.dart';
import 'package:flick/admin_panel/models/dashboard/DeviceWiseUserData.dart';
import 'package:flick/admin_panel/models/dashboard/MonthWiseUserData.dart';
import 'package:flick/admin_panel/services/firebase_services.dart';
import 'package:flick/models/User.dart';
import 'package:intl/intl.dart';

class DashboardRepository {

  late List<User> users;

  FirebaseServices firebaseServices;

  DashboardRepository(this.firebaseServices);

  Future<DashboardRepositoryResponse> getDashboardData() async {
    // TODO Firstly store top seller data and miscellaneous data in firebase and
    //  replace DashboardRepositoryResponse with DashboardData everywhere and
    //  update the functionality in the same way

    // firebaseServices.storeAllTopSellers(topSellersData);
    // firebaseServices.storeMiscellaneousData(miscellaneousDataModel);
    users = getUsersData();

    return DashboardRepositoryResponse(getMonthWiseUserData(),
        getDeviceWisePhoneData(), await getDetailsCardData());
  }

  Future<List<DetailsCardModel>> getDetailsCardData() async {
    return detailsCardData;
  }

  List<MonthWiseUserData> getMonthWiseUserData() {
    for (User user in users) {
      DateFormat dateFormat = DateFormat('MM-dd-yyyy');
      DateTime dateTime = dateFormat.parse(user.joiningDate);
      checkUserData(dateTime.month);
    }

    return [
      janMonthData,
      febMonthData,
      marMonthData,
      aprMonthData,
      mayMonthData,
      junMonthData,
      julMonthData,
      augMonthData,
      sepMonthData,
      octMonthData,
      novMonthData,
      decMonthData
    ];
  }

  DeviceWiseUserData getDeviceWisePhoneData() {
    DeviceWiseUserData deviceWiseUserData = DeviceWiseUserData(0, 0);
    for (User user in users) {
      if (user.device == "Android") {
        deviceWiseUserData.androidDeviceUserCount++;
      } else {
        deviceWiseUserData.iOSDeviceUserCount++;
      }
    }

    return deviceWiseUserData;
  }

  void checkUserData(int month) {
    switch (month) {
      case 1:
        janMonthData.usersCount++;
        break;
      case 2:
        febMonthData.usersCount++;
        break;
      case 3:
        marMonthData.usersCount++;
        break;
      case 4:
        aprMonthData.usersCount++;
        break;
      case 5:
        mayMonthData.usersCount++;
        break;
      case 6:
        junMonthData.usersCount++;
        break;
      case 7:
        julMonthData.usersCount++;
        break;
      case 8:
        augMonthData.usersCount++;
        break;
      case 9:
        sepMonthData.usersCount++;
        break;
      case 10:
        octMonthData.usersCount++;
        break;
      case 11:
        novMonthData.usersCount++;
        break;
      case 12:
        decMonthData.usersCount++;
        break;
    }
  }

  MonthWiseUserData janMonthData = MonthWiseUserData(1, 0);
  MonthWiseUserData febMonthData = MonthWiseUserData(2, 0);
  MonthWiseUserData marMonthData = MonthWiseUserData(3, 0);
  MonthWiseUserData aprMonthData = MonthWiseUserData(4, 0);
  MonthWiseUserData mayMonthData = MonthWiseUserData(5, 0);
  MonthWiseUserData junMonthData = MonthWiseUserData(6, 0);
  MonthWiseUserData julMonthData = MonthWiseUserData(7, 0);
  MonthWiseUserData augMonthData = MonthWiseUserData(8, 0);
  MonthWiseUserData sepMonthData = MonthWiseUserData(9, 0);
  MonthWiseUserData octMonthData = MonthWiseUserData(10, 0);
  MonthWiseUserData novMonthData = MonthWiseUserData(11, 0);
  MonthWiseUserData decMonthData = MonthWiseUserData(12, 0);
}
