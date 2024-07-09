import 'package:flick/admin_panel/utils/Responsive.dart';
import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/admin_panel/models/DetailsCardModel.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsCards extends StatefulWidget {
  const DetailsCards({super.key});

  @override
  State<DetailsCards> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCards> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Responsive(
      mobile: DetailsCardGridView(
        crossAxisCount: size.width < 650 ? 2 : 4,
        childAspectRatio: size.width < 650 ? 2 : 1.5,
      ),
      tablet: const DetailsCardGridView(),
      desktop: const DetailsCardGridView(),
    );
  }
}

class DetailsCardGridView extends StatelessWidget {
  const DetailsCardGridView(
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
        itemCount: detailsCardData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: appPadding,
            mainAxisSpacing: appPadding,
            childAspectRatio: childAspectRatio),
        itemBuilder: (context, index) =>
            DetailsCardLayout(cardModel: detailsCardData[index]));
  }
}

class DetailsCardLayout extends StatelessWidget {
  const DetailsCardLayout({super.key, required this.cardModel});

  final DetailsCardModel cardModel;

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
                "${cardModel.count}",
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
                    color: cardModel.color?.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(
                  cardModel.svgSrc!,
                  color: cardModel.color,
                ),
              )
            ],
          ),

          Text(
            "${cardModel.title}",
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
