import 'package:flick/admin_panel/utils/Responsive.dart';
import 'package:flick/admin_panel/models/DetailsCardModel.dart';
import 'package:flick/admin_panel/models/ReferralInfoModel.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsChipCard extends StatefulWidget {
  DetailsChipCard({super.key, this.detailsCardData, this.referralData});

  List<DetailsCardModel>? detailsCardData;
  List<ReferralInfoModel>? referralData;

  @override
  State<DetailsChipCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsChipCard> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Responsive(
      mobile: DetailsChipGridView(
        crossAxisCount: size.width < 650 ? 2 : 4,
        childAspectRatio: size.width < 650 ? 2 : 1.5,
        detailsCardData: widget.detailsCardData,
        referralData: widget.referralData
      ),
      tablet: DetailsChipGridView(detailsCardData: widget.detailsCardData,
          referralData: widget.referralData),
      desktop: DetailsChipGridView(detailsCardData: widget.detailsCardData,
          referralData: widget.referralData),
    );
  }
}

class DetailsChipGridView extends StatelessWidget {
  DetailsChipGridView(
      {super.key,
      this.crossAxisCount = 4,
      this.childAspectRatio = 1.4, this.detailsCardData, this.referralData});

  final int crossAxisCount;
  final double childAspectRatio;

  List<DetailsCardModel>? detailsCardData;
  List<ReferralInfoModel>? referralData;


  @override
  Widget build(BuildContext context) {

    bool hasReferralData = referralData != null ? true : false;

    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: hasReferralData ? referralData?.length : detailsCardData?.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: appPadding,
            mainAxisSpacing: appPadding,
            childAspectRatio: childAspectRatio),
        itemBuilder: (context, index) {
          if (hasReferralData) {
            return DetailsChipLayout(referralModel: referralData?[index]);
          } else {
            return DetailsChipLayout(detailsCardModel: detailsCardData?[index]);
          }
          return null;
        });
  }
}

class DetailsChipLayout extends StatelessWidget {
  DetailsChipLayout({super.key, this.referralModel, this.detailsCardModel});

  ReferralInfoModel? referralModel;
  DetailsCardModel? detailsCardModel;

  @override
  Widget build(BuildContext context) {
    bool hasReferralData = referralModel != null ? true : false;
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
                "${hasReferralData ? referralModel?.count : detailsCardModel?.count}",
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
                    color: hasReferralData ? referralModel?.color?.withOpacity(0.1) : detailsCardModel?.color?.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: (hasReferralData && !referralModel!.hasSvgIcon)
                    ? Image.asset(
                        referralModel!.svgSrc!,
                        height: 44,
                        width: 41,
                      )
                    : SvgPicture.asset(
                        hasReferralData ? referralModel!.svgSrc! : detailsCardModel!.svgSrc!,
                  color: hasReferralData? referralModel?.color : detailsCardModel?.color,
                ),
              )
            ],
          ),

          Text(
            "${hasReferralData ? referralModel?.title : detailsCardModel?.title}",
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
