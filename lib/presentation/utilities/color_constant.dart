
import 'package:flutter/material.dart';

class ColorConstant {
  ColorConstant._internalConstructor();

  static final ColorConstant _instance = ColorConstant._internalConstructor();

  factory ColorConstant(){
    return _instance;
  }

  static const Color kPrimaryColor = Color(0xFF266352);
  static const Color kBackgroundColor = Color(0xFFDFE2FE);
  static const Color kBlackColor = Color(0xFF152A38);
  static const Color kShadowColor = Colors.black12;
  static const Color kRedColor = Color(0xFFC22828);
  static const Color kGreenColor = Colors.green;
  static const Color kWhiteColor = Color(0xFFFEFCF3);
  static const Color kYellowColor = Color(0xFFFFB26B);
  static const Color kTransparentColor = Colors.transparent;
}