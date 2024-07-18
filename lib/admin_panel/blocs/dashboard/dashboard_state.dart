import 'package:flick/admin_panel/models/dashboard/DashboardData.dart';

abstract class DashboardState {

  const DashboardState();
}

class DashboardInitialState extends DashboardState {

  const DashboardInitialState();
}

class DashboardLoading extends DashboardState {
  final String progressMessage;

  const DashboardLoading(this.progressMessage);
}

class DashboardDataLoaded extends DashboardState {
  final DashboardData dashboardData;

  const DashboardDataLoaded(this.dashboardData);
}

class DashboardError extends DashboardState {
  final String errorMessage;

  const DashboardError(this.errorMessage);
}