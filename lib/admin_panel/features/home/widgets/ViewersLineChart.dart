import 'package:fl_chart/fl_chart.dart';
import 'package:flick/utils/ChartsData.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class ViewersLineChart extends StatelessWidget {
  const ViewersLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10)
      ),

      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text("Viewers", style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w700,
            fontSize: 15
          )),
          
          Expanded(child: ViewerLineChartLayout())
        ],
      ),
    );
  }
}

class ViewerLineChartLayout extends StatefulWidget {
  const ViewerLineChartLayout({super.key});

  @override
  State<ViewerLineChartLayout> createState() => _ViewerLineChartLayoutState();
}

class _ViewerLineChartLayoutState extends State<ViewerLineChartLayout> {
  final List<Color> gradientColor = [
    adminPanelPrimaryColor,
    secondaryColor
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(appPadding, appPadding * 1.5,
          appPadding, appPadding),
      child: LineChart(

        LineChartData(
          gridData: FlGridData(
            show: false,
          ),

          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                getTextStyles: (context, value) => const TextStyle(
                    color: lightTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
                margin: appPadding,
                getTitles: (double value) => ChartsData().getDaysLabelsFromValue(value)),
          ),

          borderData: FlBorderData(border: Border.all(width: 0)),
          minX: 0, maxX: 20,
          minY: 0, maxY: 6,

          lineBarsData: [

            LineChartBarData(
              spots: ChartsData().getViewersLineChartData(),
              isCurved: true,
              colors: [adminPanelPrimaryColor],
              barWidth: 5,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: false
              ),

              belowBarData: BarAreaData(
                show: true,
                colors: gradientColor.map((e) => e.withOpacity(0.3)).toList(),
                gradientFrom: const Offset(0, 0),
                gradientTo: const Offset(0, 2)
              )
            )
          ]
        )
      ),
    );
  }
}

