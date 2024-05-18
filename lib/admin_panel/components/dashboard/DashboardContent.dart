import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/constants/Responsive.dart';
import 'package:flick/admin_panel/features/home/widgets/DetailsCards.dart';
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
            children: [
              const Expanded(flex: 5, child: DetailsCards()),
              if (!Responsive.isMobile(context))
                Expanded(flex: 2, child: Container())
            ],
          ),
        ],
      ),
    ));
  }
}
