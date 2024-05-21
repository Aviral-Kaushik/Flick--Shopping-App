import 'package:flick/admin_panel/constants/Responsive.dart';
import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/admin_panel/models/ReferralInfoModel.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReferralsCard extends StatefulWidget {
  const ReferralsCard({super.key});

  @override
  State<ReferralsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<ReferralsCard> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Responsive(
      mobile: ReferralCarGridView(
        crossAxisCount: size.width < 650 ? 2 : 4,
        childAspectRatio: size.width < 650 ? 2 : 1.5,
      ),
      tablet: const ReferralCarGridView(),
      desktop: const ReferralCarGridView(),
    );
  }
}

class ReferralCarGridView extends StatelessWidget {
  const ReferralCarGridView(
      {super.key,
      this.crossAxisCount = 4,
      this.childAspectRatio = 1.4});

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: referralData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: appPadding,
            mainAxisSpacing: appPadding,
            childAspectRatio: childAspectRatio),
        itemBuilder: (context, index) =>
            ReferralCardLayout(referralModel: referralData[index]));
  }
}

class ReferralCardLayout extends StatelessWidget {
  const ReferralCardLayout({super.key, required this.referralModel});

  final ReferralInfoModel referralModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: appPadding, vertical: appPadding / 2),

      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(
        color: Colors.black.withOpacity(0.5),
        blurRadius: 4.5,
        blurStyle: BlurStyle.outer,
        offset: const Offset(0, 5),
      )]),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "${referralModel.count}",
                style: const TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),

              Container(
                padding: const EdgeInsets.all(appPadding / 2),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: referralModel.color?.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(
                  referralModel.svgSrc!,
                  color: referralModel.color,
                ),
              )
            ],
          ),

          Text(
            "${referralModel.title}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: textColor, fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
