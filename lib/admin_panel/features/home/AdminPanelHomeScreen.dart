import 'package:flick/admin_panel/components/dashboard/DashboardContent.dart';
import 'package:flick/admin_panel/components/drawerMenu/AdminDrawerMenu.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

import '../../constants/Responsive.dart';

class AdminPanelHomeScreen extends StatefulWidget {
  const AdminPanelHomeScreen({super.key});

  @override
  State<AdminPanelHomeScreen> createState() => _AdminPanelHomeScreenState();
}

// TODO While Adding Referral part on profile screen add all options that are in
// TODO our list and increment counter when they are pressed

class _AdminPanelHomeScreenState extends State<AdminPanelHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: const AdminDrawerMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(child: AdminDrawerMenu()),

            const Expanded(flex: 5, child: DashboardContent()),
          ],
        ),
      ),
    );
  }
}
