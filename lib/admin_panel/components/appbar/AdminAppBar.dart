import 'package:flick/admin_panel/constants/Responsive.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminAppBar extends StatelessWidget {
  const AdminAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(Icons.menu, color: Colors.black),
            )),

        Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Row(
            children: [
              Stack(children: [
                Row(
                  children: [

                    SvgPicture.asset(
                      "assets/icons/Bell.svg",
                      height: 25,
                      color: textColor.withOpacity(0.8),
                    ),

                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration:
                            const BoxDecoration(shape: BoxShape.circle, color: red),
                      ),
                    )
                  ],
                ),
              ]),

              Container(
                margin: const EdgeInsets.only(left: appPadding),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/images/photo3.jpg',
                        height: 38,
                        width: 38,
                        fit: BoxFit.cover,
                      ),
                    ),

                    if (!Responsive.isMobile(context))
                      const Padding(
                        padding: EdgeInsets.only(left: appPadding / 2),
                        child: Text(
                          "Hii, Avichal",
                          style:
                          TextStyle(color: textColor, fontWeight: FontWeight.w800),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
