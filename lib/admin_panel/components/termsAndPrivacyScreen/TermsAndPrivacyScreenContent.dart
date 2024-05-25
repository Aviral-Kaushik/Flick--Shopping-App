import 'package:flutter/material.dart';

class TermsAndPrivacyScreenContent extends StatefulWidget {
  const TermsAndPrivacyScreenContent({super.key, required this.showUIForPrivacyPolicy});

  final bool showUIForPrivacyPolicy;

  @override
  State<TermsAndPrivacyScreenContent> createState() => _TermsAndPrivacyScreenContentState();
}

class _TermsAndPrivacyScreenContentState extends State<TermsAndPrivacyScreenContent> {

  @override
  void initState() {
    super.initState();
    bool? showUiForPrivacyPolicy = (widget.showUIForPrivacyPolicy != null) ?
                                        widget.showUIForPrivacyPolicy : false;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
