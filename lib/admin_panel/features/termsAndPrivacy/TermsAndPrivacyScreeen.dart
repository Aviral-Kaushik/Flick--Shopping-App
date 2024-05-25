import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/components/termsAndPrivacyScreen/TermsAndPrivacyScreenContent.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class TermsAndPrivacyScreen extends StatefulWidget {
  const TermsAndPrivacyScreen({super.key, this.showUIForPrivacyPolicy});

  final bool? showUIForPrivacyPolicy;

  @override
  State<TermsAndPrivacyScreen> createState() => _TermsAndPrivacyState();
}

class _TermsAndPrivacyState extends State<TermsAndPrivacyScreen> {
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
      drawer: const AdminAppBar(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: TermsAndPrivacyScreenContent(showUIForPrivacyPolicy: showUiForPrivacyPolicy,))
          ],
        ),
      )
    );
  }
}
