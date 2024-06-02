import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/components/widgets/DetailsChipCard.dart';
import 'package:flick/admin_panel/components/widgets/SerachBarWithButton.dart';
import 'package:flick/admin_panel/models/DetailsCardModel.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdminSettingsScreenContent extends StatefulWidget {
  const AdminSettingsScreenContent({super.key});

  @override
  State<AdminSettingsScreenContent> createState() => _AdminSettingsScreenContentState();
}

class _AdminSettingsScreenContentState extends State<AdminSettingsScreenContent> {

  late DetailsCardModel adminCardModel;
  late int totalAdmins;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // TODO Fetch Admin Data Here
    totalAdmins = 12;

    adminCardModel = DetailsCardModel(
      title: "Total Admins",
      count: totalAdmins,
      svgSrc: "assets/icons/Subscribers.svg",
      color: adminPanelPrimaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
            left: appPadding, right: appPadding, bottom: appPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const AdminAppBar(),

            const SizedBox(
              height: appPadding,
            ),

            const Text("Settings", style: TextStyle(
              color: textColor,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),

            const SizedBox(
              height: appPadding,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AdminChipCard(adminCardModel: adminCardModel),

                GestureDetector(
                  onTap: () {
                    // TODO Show Add new admin dialog here
                  },
                  child: Container(
                    padding: const EdgeInsets.all(appPadding),

                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(appPadding),
                      boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 4.5,
                          blurStyle: BlurStyle.outer,
                        )]
                    ),

                    child: const Center(
                      child: Icon(Icons.add, color: Colors.black)
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(
              height: appPadding * 2,
            ),

            SearchBarWithButton(
              searchController: searchController,
                onPressed: () {
                // TODO : Implement search here
              }
            ),

            const SizedBox(
              height: appPadding,
            ),
          ],
        ),
      ),
    );
  }
}

class AdminChipCard extends StatefulWidget {
  const AdminChipCard({super.key, required this.adminCardModel});

  final DetailsCardModel adminCardModel;

  @override
  State<AdminChipCard> createState() => _AdminChipCardState();
}

class _AdminChipCardState extends State<AdminChipCard> {
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
                "${widget.adminCardModel.count}",
                style: const TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),

              const SizedBox(width: appPadding * 2,),

              Container(
                padding: const EdgeInsets.all(appPadding / 2),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: widget.adminCardModel.color?.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(
                  widget.adminCardModel.svgSrc!,
                  color: widget.adminCardModel.color,
                ),
              )
            ],
          ),

          const SizedBox(width: appPadding,),

          Text(
            "${widget.adminCardModel.title}",
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

