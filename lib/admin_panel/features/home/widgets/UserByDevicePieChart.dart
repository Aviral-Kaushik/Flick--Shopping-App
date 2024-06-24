import 'dart:math';

import 'package:flick/admin_panel/models/dashboard/DeviceWiseUserData.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class UserByDevicePieChart extends StatelessWidget {
  const UserByDevicePieChart({super.key, required this.deviceWiseUserData});

  final DeviceWiseUserData deviceWiseUserData;

  @override
  Widget build(BuildContext context) {

    var totalUser = deviceWiseUserData.androidDeviceUserCount + deviceWiseUserData.iOSDeviceUserCount;

    var androidUsersPercentage = (deviceWiseUserData.androidDeviceUserCount / totalUser) * 100;

    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.all(appPadding),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text("User By Device", style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w700,
            fontSize: 15
          )),

          Container(
            margin: const EdgeInsets.all(appPadding),
            padding: const EdgeInsets.all(appPadding),
            height: 230,
            child: CustomPaint(
              foregroundPainter: RadialPainter(
                backgroundColor: textColor.withOpacity(0.1),
                lineColor: adminPanelPrimaryColor,
                percentage: androidUsersPercentage / 100,
                width: 18.0,
              ),

              child: Center(
                child: Text("${androidUsersPercentage.toInt()}%", style: const TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 36
                ),),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [

                Row(
                  children: [
                    const Icon(Icons.circle, color: adminPanelPrimaryColor, size: 10,),

                    const SizedBox(width: appPadding / 2,),

                    Text("Android", style: TextStyle(
                      color: textColor.withOpacity(0.5),
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),

                Row(
                  children: [
                    Icon(Icons.circle, color: textColor.withOpacity(0.2), size: 10,),

                    const SizedBox(width: appPadding / 2,),

                    Text("iOS", style: TextStyle(
                        color: textColor.withOpacity(0.5),
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RadialPainter extends CustomPainter {
  const RadialPainter({
    required this.backgroundColor,
    required this.lineColor,
    required this.percentage,
    required this.width});

  final Color backgroundColor;
  final Color lineColor;
  final double percentage;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    Paint nonColouredLine = Paint()
        ..color = backgroundColor
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = width;

    Paint colouredLine = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, nonColouredLine);
    
    double sweepAngle = 2 * pi * percentage;
    
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        sweepAngle,
        false,
        colouredLine);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

