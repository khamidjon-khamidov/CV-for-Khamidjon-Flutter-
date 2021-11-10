import 'package:cv_for_khamidjon/base/preferences_helper.dart';
import 'package:cv_for_khamidjon/utils/constants.dart';
import 'package:flutter/material.dart';

abstract class PreferencesProvider {
  static String? _inMemoryLanguage;
  static ThemeMode _inMemoryDayNightMode = ThemeMode.system;

  static String? get inMemoryLanguage => _inMemoryLanguage;
  static ThemeMode get inMemoryDayNightMode => _inMemoryDayNightMode;

  static Future<String?> loadLanToMemoryAndReturn() async {
    _inMemoryLanguage = await PreferencesHelper.getString(AppConstants.LANGUAGE_KEY);
    return inMemoryLanguage;
  }

  static Future<void> setLanguage(String? language) async {
    _inMemoryLanguage = language;
    if (language != null) await PreferencesHelper.setString(AppConstants.LANGUAGE_KEY, language);
  }

  static Future<ThemeMode> loadDayNightModeToMemoryAndReturn() async {
    bool? mode = await PreferencesHelper.getBool(AppConstants.DAY_NIGHT_MODE_KEY);
    _inMemoryDayNightMode = mode == true
        ? ThemeMode.light
        : mode == false
            ? ThemeMode.light
            : ThemeMode.system;
    return inMemoryDayNightMode;
  }

  static Future<void> setDayNightMode(bool isDay) async {
    _inMemoryDayNightMode = isDay ? ThemeMode.light : ThemeMode.dark;
    await PreferencesHelper.setBool(AppConstants.LANGUAGE_KEY, isDay);
  }
}
