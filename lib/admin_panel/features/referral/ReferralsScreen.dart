import 'package:flick/admin_panel/components/drawerMenu/AdminDrawerMenu.dart';
import 'package:flick/admin_panel/components/referralScreen/ReferralsScrrenContent.dart';
import 'package:flick/admin_panel/constants/Responsive.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class ReferralsScreen extends StatefulWidget {
  const ReferralsScreen({super.key});

  @override
  State<ReferralsScreen> createState() => _ReferralsScreenState();
}

class _ReferralsScreenState extends State<ReferralsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: const AdminDrawerMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!Responsive.isMobile(context))
              const Expanded(child: AdminDrawerMenu()),

            const Expanded(child: ReferralsScreenContent())
          ],
        ),
      ),
    );
  }
}
