import 'package:flick/admin_panel/components/drawerMenu/AdminDrawerMenu.dart';
import 'package:flick/admin_panel/components/referralScreen/admin_referral_screen_content.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class AdminReferralsScreen extends StatefulWidget {
  const AdminReferralsScreen({super.key});

  @override
  State<AdminReferralsScreen> createState() => _AdminReferralsScreenState();
}

class _AdminReferralsScreenState extends State<AdminReferralsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgColor,
      drawer: AdminDrawerMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: AdminReferralsScreenContent())
            ],
          ),
        ),
      ),
    );
  }
}
