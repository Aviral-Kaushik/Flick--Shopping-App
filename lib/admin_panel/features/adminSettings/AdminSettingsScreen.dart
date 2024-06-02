import 'package:flick/admin_panel/components/adminSettingsScreen/AdminSettingsScreenContent.dart';
import 'package:flick/admin_panel/components/drawerMenu/AdminDrawerMenu.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgColor,
      drawer: AdminDrawerMenu(),
      body: SafeArea(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: AdminSettingsScreenContent())
            ],
          ),
      ),
    );
  }
}
