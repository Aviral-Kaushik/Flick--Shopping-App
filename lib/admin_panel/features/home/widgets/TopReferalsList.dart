import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/admin_panel/models/ReferralInfoModel.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopReferralsList extends StatelessWidget {
  const TopReferralsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: referralData.length * 88,
      padding: const EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Text(
                "Top Sellers",
                style: TextStyle(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),

              Text(
                "View All",
                style: TextStyle(
                    color: textColor.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),

          const SizedBox(
            height: appPadding,
          ),

          Flexible(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: referralData.length,
                  itemBuilder: (context, index) => TopReferralListLayout(
                        referralInfoModel: referralData[index],
                      )))
        ],
      ),
    );
  }
}

class TopReferralListLayout extends StatelessWidget {
  const TopReferralListLayout({super.key, required this.referralInfoModel});

  final ReferralInfoModel referralInfoModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: appPadding),
      padding: const EdgeInsets.all(appPadding / 2),
      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(appPadding / 1.5),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: referralInfoModel.color?.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30)),

            child: SvgPicture.asset(
              "${referralInfoModel.svgSrc}",
              color: referralInfoModel.color,
            ),
          ),
          
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  "${referralInfoModel.title}",
                  style: const TextStyle(color: textColor),
                  maxLines: 1, overflow: TextOverflow.ellipsis
                ),

                Text(
                    "${referralInfoModel.count}",
                    style: const TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold
                    ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
