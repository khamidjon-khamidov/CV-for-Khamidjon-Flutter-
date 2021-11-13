import 'package:cv_for_khamidjon/base/preferences_helper.dart';
import 'package:cv_for_khamidjon/utils/constants.dart';
import 'package:flutter/material.dart';

abstract class PreferencesProvider {
  static Locale _inMemoryLocale = Locale.fromSubtags(languageCode: 'en');
  static ThemeMode _inMemoryDayNightMode = ThemeMode.system;

  static Locale get inMemoryLocale => _inMemoryLocale;
  static ThemeMode get inMemoryDayNightMode => _inMemoryDayNightMode;

  static Future<Locale> loadLanToMemoryAndReturn() async {
    _inMemoryLocale = Locale.fromSubtags(
        languageCode: await PreferencesHelper.getString(AppConstants.LANGUAGE_KEY) ?? 'en');
    return inMemoryLocale;
  }

  static Future<void> setLanguage(Locale locale) async {
    _inMemoryLocale = locale;
    await PreferencesHelper.setString(AppConstants.LANGUAGE_KEY, locale.languageCode);
  }

  static Future<ThemeMode> loadDayNightModeToMemoryAndReturn() async {
    bool? mode = await PreferencesHelper.getBool(AppConstants.DAY_NIGHT_MODE_KEY);
    _inMemoryDayNightMode = mode == true
        ? ThemeMode.light
        : mode == false
            ? ThemeMode.dark
            : ThemeMode.system;
    return inMemoryDayNightMode;
  }

  static Future<void> setDayNightMode(bool isDay) async {
    _inMemoryDayNightMode = isDay ? ThemeMode.light : ThemeMode.dark;
    await PreferencesHelper.setBool(AppConstants.DAY_NIGHT_MODE_KEY, isDay);
  }
}
