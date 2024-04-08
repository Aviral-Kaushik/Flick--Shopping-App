import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: appPadding, right: appPadding, bottom: appPadding),
          child: Column(
            children: [
              AdminAppBar(),
            ],
        ),
    ));
  }
}
