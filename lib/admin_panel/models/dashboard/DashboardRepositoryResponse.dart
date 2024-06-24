import 'package:flick/admin_panel/models/DetailsCardModel.dart';
import 'package:flick/admin_panel/models/dashboard/DeviceWiseUserData.dart';
import 'package:flick/admin_panel/models/dashboard/MonthWiseUserData.dart';

class DashboardRepositoryResponse {
  final List<MonthWiseUserData> monthWiseUserData;
  final DeviceWiseUserData deviceWiseUserData;
  final List<DetailsCardModel> detailsCardModel;

  DashboardRepositoryResponse(
      this.monthWiseUserData, this.deviceWiseUserData, this.detailsCardModel);
}