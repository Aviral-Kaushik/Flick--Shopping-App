import 'package:flick/admin_panel/blocs/dashboard/dashboard_event.dart';
import 'package:flick/admin_panel/blocs/dashboard/dashboard_state.dart';
import 'package:flick/admin_panel/repositories/dashboard_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {

  final DashboardRepository dashboardRepository;

  DashboardBloc(this.dashboardRepository) : super(const DashboardInitialState()) {
    on<LoadDashboardData>((event, emit) async {
      emit(const DashboardLoading("Please wait! Loading Data"));

      final dashboardRepositoryResponse = await dashboardRepository.getDashboardData();

      emit(DashboardDataLoaded(dashboardRepositoryResponse));
    });
  }

}