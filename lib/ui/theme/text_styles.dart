import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const String fontFamily = 'SF Pro Display';

  /// 20/Regular
  static const TextStyle regular20 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  /// 16/Regular
  static const TextStyle regular16 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  /// 10/Regular
  static const TextStyle regular10 = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  /// 12/Regular
  static const TextStyle regular12 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  /// 14/Regular
  static const TextStyle regular14 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  /// 12/Medium
  static const TextStyle medium12 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  /// 14/Medium
  static const TextStyle medium14 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  /// 16/Medium
  static const TextStyle medium16 = TextStyle(
    height: 1.5,
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  /// 20/Medium
  static const TextStyle medium20 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  /// 24/Bold
  static const TextStyle bold24 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
}
