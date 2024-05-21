import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/components/widgets/DetailsChipCard.dart';
import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class ReferralsScreenContent extends StatefulWidget {
  const ReferralsScreenContent({super.key});

  @override
  State<ReferralsScreenContent> createState() => _ReferralsScreenContentState();
}

class _ReferralsScreenContentState extends State<ReferralsScreenContent> {
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

            DetailsChipCard(referralData: referralData)
          ],
        ),
      ),
    );
  }
}
