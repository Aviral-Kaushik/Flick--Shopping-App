import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

import 'Colors.dart';

class ChartsData {

  List<BarChartGroupData> getBarChartData() {
    List<BarChartGroupData> barChartData = [];

    barChartData.add(BarChartGroupData(x: 1, barRods: [
      BarChartRodData(
          y: 10,
          width: 20,
          colors: [adminPanelPrimaryColor],
          borderRadius: BorderRadius.circular(5))
    ]));

    barChartData.add(BarChartGroupData(x: 2, barRods: [
      BarChartRodData(
          y: 3,
          width: 20,
          colors: [adminPanelPrimaryColor],
          borderRadius: BorderRadius.circular(5))
    ]));

    barChartData.add(BarChartGroupData(x: 3, barRods: [
      BarChartRodData(
          y: 12,
          width: 20,
          colors: [adminPanelPrimaryColor],
          borderRadius: BorderRadius.circular(5))
    ]));

    barChartData.add(BarChartGroupData(x: 4, barRods: [
      BarChartRodData(
          y: 8,
          width: 20,
          colors: [adminPanelPrimaryColor],
          borderRadius: BorderRadius.circular(5))
    ]));

    barChartData.add(BarChartGroupData(x: 5, barRods: [
      BarChartRodData(
          y: 6,
          width: 20,
          colors: [adminPanelPrimaryColor],
          borderRadius: BorderRadius.circular(5))
    ]));

    barChartData.add(BarChartGroupData(x: 6, barRods: [
      BarChartRodData(
          y: 10,
          width: 20,
          colors: [adminPanelPrimaryColor],
          borderRadius: BorderRadius.circular(5))
    ]));

    barChartData.add(BarChartGroupData(x: 7, barRods: [
      BarChartRodData(
          y: 11,
          width: 20,
          colors: [adminPanelPrimaryColor],
          borderRadius: BorderRadius.circular(5))
    ]));

    barChartData.add(BarChartGroupData(x: 8, barRods: [
      BarChartRodData(
          y: 6,
          width: 20,
          colors: [adminPanelPrimaryColor],
          borderRadius: BorderRadius.circular(5))
    ]));

    barChartData.add(BarChartGroupData(x: 9, barRods: [
      BarChartRodData(
          y: 5,
          width: 20,
          colors: [adminPanelPrimaryColor],
          borderRadius: BorderRadius.circular(5))
    ]));

    barChartData.add(BarChartGroupData(x: 10, barRods: [
      BarChartRodData(
          y: 4,
          width: 20,
          colors: [adminPanelPrimaryColor],
          borderRadius: BorderRadius.circular(5))
    ]));

    barChartData.add(BarChartGroupData(x: 11, barRods: [
      BarChartRodData(
          y: 9,
          width: 20,
          colors: [adminPanelPrimaryColor],
          borderRadius: BorderRadius.circular(5))
    ]));

    barChartData.add(BarChartGroupData(x: 12, barRods: [
      BarChartRodData(
          y: 7,
          width: 20,
          colors: [adminPanelPrimaryColor],
          borderRadius: BorderRadius.circular(5))
    ]));


    return barChartData;
  }

}