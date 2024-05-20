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
  
  List<FlSpot> getViewersLineChartData() {
    List<FlSpot> lineChartData = [];
    
    lineChartData.add(FlSpot(0, 3));
    lineChartData.add(FlSpot(4, 2));
    lineChartData.add(FlSpot(9, 4));
    lineChartData.add(FlSpot(12, 3));
    lineChartData.add(FlSpot(15, 5));
    lineChartData.add(FlSpot(18, 3));
    lineChartData.add(FlSpot(20, 4));

    return lineChartData;
  }

  String getMonthsLabelsFromValue(double value) {
    if (value == 1) {
      return 'Jan';
    } else if (value == 3) {
      return 'Mar';
    } else if (value == 5) {
      return 'May';
    } else if (value == 7) {
      return 'Jul';
    } else if (value == 9) {
      return 'Sep';
    } else if (value == 11) {
      return 'Nov';
    }
    return '';
  }

  String getUsersLabelsFromValue(double value) {
    if (value == 1) {
      return '1K';
    } else if (value == 6) {
      return '2K';
    } else if (value == 10) {
      return '3K';
    } else if (value == 14) {
      return '4K';
    }
    return '';
  }

  String getDaysLabelsFromValue(double value) {
    switch (value.toInt()) {
      case 1:
        return 'Sun';
      case 4:
        return 'Mon';
      case 7:
        return 'Tue';
      case 10:
        return 'Wed';
      case 13:
        return 'Thu';
      case 16:
        return 'Fri';
      case 19:
        return 'Sat';
      default:
        return '';
    }
  }

}