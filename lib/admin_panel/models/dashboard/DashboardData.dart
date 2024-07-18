import 'package:flick/admin_panel/models/DetailsCardModel.dart';
import 'package:flick/admin_panel/models/MiscellaneousDataModel.dart';
import 'package:flick/admin_panel/models/TopSellersModel.dart';
import 'package:flick/admin_panel/models/dashboard/DeviceWiseUserData.dart';
import 'package:flick/admin_panel/models/dashboard/MonthWiseUserData.dart';

class DashboardData {

  final MiscellaneousDataModel miscellaneousData;
  final List<MonthWiseUserData> monthWiseUserData;
  final List<TopSellersModel> topSellersModel;
  final DeviceWiseUserData deviceWiseUserData;
  final List<DetailsCardModel> detailsCardModel;

  DashboardData(
      {required this.miscellaneousData,
      required this.monthWiseUserData,
      required this.topSellersModel,
      required this.deviceWiseUserData,
      required this.detailsCardModel});
}
