import 'package:flutter/material.dart';

abstract class AppLevelVariables {
  static ThemeMode currentThemeMode = ThemeMode.dark;
  static Locale currentLocale = Locale.fromSubtags(languageCode: 'en');
}
