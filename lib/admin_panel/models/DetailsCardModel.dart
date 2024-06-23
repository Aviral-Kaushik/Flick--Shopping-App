import 'package:flutter/material.dart';

class DetailsCardModel {
  final String? svgSrc, title;
  int? count;
  final Color? color;

  DetailsCardModel({
    this.svgSrc,
    this.title,
    this.count,
    this.color,
  });
}