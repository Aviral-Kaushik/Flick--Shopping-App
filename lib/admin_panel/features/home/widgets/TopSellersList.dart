import 'package:flick/admin_panel/models/TopSellersModel.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class TopSellersList extends StatelessWidget {
  const TopSellersList({super.key, required this.topSellersList});

  final List<TopSellersModel> topSellersList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: topSellersList.length * 80,
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
                  itemCount: topSellersList.length,
                  itemBuilder: (context, index) => TopSellerListLayout(
                        sellerModel: topSellersList[index],
                      )))
        ],
      ),
    );
  }
}

class TopSellerListLayout extends StatelessWidget {
  const TopSellerListLayout({super.key, required this.sellerModel});

  final TopSellersModel sellerModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: appPadding),
      padding: const EdgeInsets.all(appPadding / 2),
      child: Row(
        children: [

          ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                "${sellerModel.imageSrc}",
                height: 38,
                width: 38,
                fit: BoxFit.cover,
              )),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "${sellerModel.name}",
                    style: const TextStyle(
                        color: textColor, fontWeight: FontWeight.w600),
                  ),

                  Text(
                    "${sellerModel.date}",
                    style: TextStyle(
                        color: textColor.withOpacity(0.5), fontSize: 13),
                  ),
                ],
              ),
            ),
          ),

          Icon(
            Icons.more_vert_rounded,
            color: textColor.withOpacity(0.5),
            size: 18,
          )
        ],
      ),
    );
  }
}
