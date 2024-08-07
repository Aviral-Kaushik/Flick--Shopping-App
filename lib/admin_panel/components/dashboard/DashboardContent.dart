import 'package:flick/admin_panel/blocs/dashboard/dashboard_bloc.dart';
import 'package:flick/admin_panel/blocs/dashboard/dashboard_event.dart';
import 'package:flick/admin_panel/blocs/dashboard/dashboard_state.dart';
import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/components/widgets/DetailsChipCard.dart';
import 'package:flick/admin_panel/models/dashboard/DashboardData.dart';
import 'package:flick/admin_panel/utils/Responsive.dart';
import 'package:flick/admin_panel/features/home/widgets/TopSellersList.dart';
import 'package:flick/admin_panel/features/home/widgets/UserByDevicePieChart.dart';
import 'package:flick/admin_panel/features/home/widgets/UsersChart.dart';
import 'package:flick/admin_panel/features/home/widgets/ViewersLineChart.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {

  DashboardBloc dashboardBloc = locator.get<DashboardBloc>();
  late DialogHelper dialogHelper;
  DashboardData? dashboardData;

  bool isAnyDialogShowing = false;

  @override
  void initState() {
    super.initState();

    dialogHelper = DialogHelper(context);
    dashboardBloc.add(const LoadDashboardData());
  }

  showProgressDialog(String message) {
    isAnyDialogShowing = true;

    dialogHelper.showProgressDialog(message, () {
      isAnyDialogShowing = false;
    });
  }

  showErrorDialog(String message) {
    isAnyDialogShowing = true;

    dialogHelper.showSuccessfulOrErrorDialog("Oops!", message, "Dismiss", true,
        () {
      isAnyDialogShowing = false;
    });
  }

  dismissAllDialogs() {
    if (isAnyDialogShowing) {

      isAnyDialogShowing = false;

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (_) => dashboardBloc,
      child: BlocListener<DashboardBloc, DashboardState>(
        listener: (context, state) {

          if (state is DashboardLoading) {

            dismissAllDialogs();
            showProgressDialog(state.progressMessage);

          }

          if (state is DashboardDataLoaded) {
            dashboardData = state.dashboardData;
            setState(() {});

            dismissAllDialogs();
          }

          if (state is DashboardError) {

            dismissAllDialogs();
            showErrorDialog(state.errorMessage);

          }

        },
        child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                  left: appPadding, right: appPadding, bottom: appPadding),
              child: Column(
                children: [
                  const AdminAppBar(),

                  const SizedBox(
                    height: appPadding,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              dashboardData != null
                              ? DetailsChipCard(
                                  detailsCardData: dashboardData?.detailsCardModel,
                                )
                              : const SizedBox(
                                  height: 0,
                                ),

                              const SizedBox(height: appPadding * 1.7,),

                              dashboardData != null
                                  ? UsersChart(
                                      monthWiseUserData:
                                          dashboardData!
                                              .monthWiseUserData)
                                  : const SizedBox(
                                      height: 0,
                                    ),

                              if (Responsive.isMobile(context))
                                const SizedBox(height: appPadding * 1.7,),
                                TopSellersList(
                                  topSellersList:
                                      dashboardData?.topSellersModel != null
                                          ? dashboardData!.topSellersModel
                                          : [],
                                )
                        ],
                          )),
                    ],
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Expanded(child: Column(
                        children: [

                          const ViewersLineChart(),

                          const SizedBox(height: appPadding * 1.7,),

                          dashboardData != null
                          ? UserByDevicePieChart(
                              deviceWiseUserData: dashboardData!
                                  .deviceWiseUserData,
                            )
                          : const SizedBox(
                              height: 0,
                            ),
                        ],
                      ))
                    ],
                  )

                ],
              ),
          )
        ),
      ),
    );
  }
}
