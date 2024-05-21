import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/constants/Responsive.dart';
import 'package:flick/admin_panel/features/home/widgets/DetailsCards.dart';
import 'package:flick/admin_panel/features/home/widgets/TopSellersList.dart';
import 'package:flick/admin_panel/features/home/widgets/UserByDevicePieChart.dart';
import 'package:flick/admin_panel/features/home/widgets/UsersChart.dart';
import 'package:flick/admin_panel/features/home/widgets/ViewersLineChart.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      const DetailsCards(),

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
                  // TopReferralsList(),
                  //
                  // SizedBox(height: appPadding * 1.7,),

                  ViewersLineChart(),

                  SizedBox(height: appPadding * 1.7,),

                  UserByDevicePieChart(),
                ],
              ))
            ],
          )

        ],
      ),
    ));
  }
}
