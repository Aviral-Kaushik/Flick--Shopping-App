import 'package:flutter/material.dart';

class ReferralInfoModel {
  final String? svgSrc, title;
  final int? count;
  final Color? color;
  final bool hasSvgIcon;

  ReferralInfoModel({
    this.svgSrc,
    this.title,
    this.count,
    this.color,
    this.hasSvgIcon = true,
  });
}