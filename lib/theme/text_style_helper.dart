import 'package:flutter/material.dart';

class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._internal();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._internal();
    return _instance!;
  }

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title18BoldInter => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
        color: Colors.white,
      );

  TextStyle get title22BoldInter => TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
        color: Colors.white,
      );

  TextStyle get title16MediumInter => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
        color: Colors.white,
      );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body14Inter => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontFamily: 'Inter',
        color: Colors.white70,
      );

  TextStyle get body12MediumInter => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
        color: Colors.white70,
      );

  // New tablet-optimized text styles
  TextStyle get title24BoldInter => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
        color: Colors.white,
      );

  TextStyle get title14BoldInter => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
        color: Colors.white,
      );

  TextStyle get body16Inter => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        fontFamily: 'Inter',
        color: Colors.white70,
      );

  TextStyle get body18Inter => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        fontFamily: 'Inter',
        color: Colors.white70,
      );
}
