import 'package:fl_chart/fl_chart.dart';
import 'package:flick/admin_panel/models/dashboard/MonthWiseUserData.dart';
import 'package:flick/utils/ChartsData.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class UsersChart extends StatelessWidget {
  const UsersChart({super.key, required this.monthWiseUserData});

  final List<MonthWiseUserData> monthWiseUserData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      padding: const EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Users",
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 15, color: textColor),
          ),

          Expanded(child: BarChartUsers(monthWiseUserData: monthWiseUserData))
        ],
      ),
    );
  }
}

class BarChartUsers extends StatelessWidget {
  const BarChartUsers({super.key, required this.monthWiseUserData});

  final List<MonthWiseUserData> monthWiseUserData;

  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
        maxY: 5,
        backgroundColor: secondaryColor,
        borderData: FlBorderData(border: Border.all(width: 0)),
        groupsSpace: 15,
        titlesData: FlTitlesData(
            show: true,

            bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context, value) => const TextStyle(
                    color: lightTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
                margin: appPadding,
                getTitles: (double value) =>
                    ChartsData().getMonthsLabelsFromValue(value)),

            leftTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context, value) => const TextStyle(
                    color: lightTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
                margin: appPadding,
                getTitles: (double value) =>
                    ChartsData().getUsersLabelsFromValue(value))),

        barGroups: ChartsData().getBarChartData(monthWiseUserData)));
  }
}
