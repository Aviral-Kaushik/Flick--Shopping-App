import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/components/widgets/DetailsChipCard.dart';
import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class ReferralsScreenContent extends StatefulWidget {
  const ReferralsScreenContent({super.key});

  @override
  State<ReferralsScreenContent> createState() => _ReferralsScreenContentState();
}

class _ReferralsScreenContentState extends State<ReferralsScreenContent> {

  String initialTextMessage = "Flick is an innovative e-commerce application designed to revolutionize online shopping experiences. With a sleek interface and user-friendly features, Flick empowers users to browse, discover, and purchase products effortlessly.";

  var referralMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    referralMessageController.text = initialTextMessage;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
                left: appPadding, right: appPadding, bottom: appPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AdminAppBar(),

                const SizedBox(
                  height: appPadding,
                ),

                DetailsChipCard(referralData: referralData),

                const SizedBox(
                  height: appPadding * 3,
                ),

                const Text("Referral Message", style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                )),

                const SizedBox(height: 4,),

                const Text("This message will be shared with each referral message with app link",
                style: TextStyle(
                  color: grey,
                  fontSize: 11
                ),),

                const SizedBox(height: appPadding * 2 ,),

                TextFormField(
                  minLines: 8,
                  maxLines: null,
                  controller: referralMessageController,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: adminPanelPrimaryColor
                      )
                    ),
                    labelText: "Referral Message",
                  ),
                ),

                const SizedBox(height: appPadding * 2 ,),

              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              // TODO Show Successful Dialog Here
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  top: appPadding / 2,
                  bottom: appPadding / 2),

              margin: const EdgeInsets.all(appPadding),

              decoration: BoxDecoration(
                  color: adminPanelPrimaryColor,
                  borderRadius: BorderRadius.circular(24)
              ),

              child: Center(
                child: Text("Submit", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: whiteColor
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
