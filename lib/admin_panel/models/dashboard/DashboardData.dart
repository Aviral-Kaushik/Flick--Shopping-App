import 'package:flick/admin_panel/models/MiscellaneousDataModel.dart';
import 'package:flick/admin_panel/models/TopSellersModel.dart';
import 'package:flick/admin_panel/models/dashboard/DeviceWiseUserData.dart';
import 'package:flick/admin_panel/models/dashboard/MonthWiseUserData.dart';

class DashboardData {

  final MiscellaneousDataModel miscellaneousData;
  final MonthWiseUserData monthWiseUserData;
  final List<TopSellersModel> topSellersModel;
  final DeviceWiseUserData deviceWiseUserData;

  DashboardData(
      this.miscellaneousData,
      this.monthWiseUserData,
      this.topSellersModel,
      this.deviceWiseUserData);
}