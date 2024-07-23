import 'package:flick/admin_panel/components/drawerMenu/AdminDrawerMenu.dart';
import 'package:flick/admin_panel/components/termsAndPrivacyAdminScreen/TermsAndPrivacyAdminScreenContent.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class TermsAndPrivacyAdminScreen extends StatefulWidget {
  const TermsAndPrivacyAdminScreen({super.key, this.showUIForPrivacyPolicy});

  final bool? showUIForPrivacyPolicy;

  @override
  State<TermsAndPrivacyAdminScreen> createState() => _TermsAndPrivacyState();
}

class _TermsAndPrivacyState extends State<TermsAndPrivacyAdminScreen> {
  late bool showUiForPrivacyPolicy;

  @override
  void initState() {
    super.initState();
    showUiForPrivacyPolicy = ((widget.showUIForPrivacyPolicy != null) ? widget.showUIForPrivacyPolicy : false)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: const AdminDrawerMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: TermsAndPrivacyAdminScreenContent(showUIForPrivacyPolicy: showUiForPrivacyPolicy,))
            ],
          ),
        ),
      )
    );
  }
}
