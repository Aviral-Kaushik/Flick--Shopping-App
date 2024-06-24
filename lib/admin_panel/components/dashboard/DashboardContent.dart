import 'dart:convert';

import 'package:flick/admin_panel/blocs/dashboard/dashboard_bloc.dart';
import 'package:flick/admin_panel/blocs/dashboard/dashboard_event.dart';
import 'package:flick/admin_panel/blocs/dashboard/dashboard_state.dart';
import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/components/widgets/DetailsChipCard.dart';
import 'package:flick/admin_panel/constants/Responsive.dart';
import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/admin_panel/features/home/widgets/TopSellersList.dart';
import 'package:flick/admin_panel/features/home/widgets/UserByDevicePieChart.dart';
import 'package:flick/admin_panel/features/home/widgets/UsersChart.dart';
import 'package:flick/admin_panel/features/home/widgets/ViewersLineChart.dart';
import 'package:flick/admin_panel/models/dashboard/MonthWiseUserData.dart';
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

  @override
  void initState() {
    super.initState();

    dashboardBloc.add(const LoadDashboardData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (_) => dashboardBloc,
      child: BlocListener<DashboardBloc, DashboardState>(
        listener: (context, state) {

          if (state is DashboardDataLoaded) {
            print("Aviral Admin Data Loaded");
            final monthWiseUserData = state.dashboardRepositoryResponse.monthWiseUserData;
            print("Aviral Month Wise User Data");
            for (MonthWiseUserData userData in monthWiseUserData) {
              print("${userData.month} : ${userData.usersCount}");
            }
            print("Aviral Device Wise User Data");
            print("Android: ${state.dashboardRepositoryResponse.deviceWiseUserData.androidDeviceUserCount}");
            print("iOS: ${state.dashboardRepositoryResponse.deviceWiseUserData.iOSDeviceUserCount}");
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
                              DetailsChipCard(detailsCardData: detailsCardData,),

                              const SizedBox(height: appPadding * 1.7,),

                              const UsersChart(),

                              // TODO This Top User list is not visible in phone we can show
                              // TODO this in different screen in the drawer or below.
                              if (Responsive.isMobile(context))
                                const SizedBox(height: appPadding * 1.7,),
                                const TopSellersList()

                            ],
                          )),
                    ],
                  ),

                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Expanded(child: Column(
                        children: [

                          ViewersLineChart(),

                          SizedBox(height: appPadding * 1.7,),

                          UserByDevicePieChart(),
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
