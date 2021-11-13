import 'package:bloc/bloc.dart';
import 'package:cv_for_khamidjon/domain/providers/storage/preferences_provider.dart';
import 'package:cv_for_khamidjon/utils/app_level_variables.dart';
import 'package:flutter/material.dart';

class AppSettingsCubit extends Cubit<AppSettings> {
  AppSettingsCubit()
      : super(AppSettings(
          themeMode: PreferencesProvider.inMemoryDayNightMode,
          language: PreferencesProvider.inMemoryLocale,
        ));

  void changeLanguage(Locale locale) async {
    AppLevelVariables.currentLocale = locale;
    await PreferencesProvider.setLanguage(locale);
    emit(AppSettings(
      themeMode: PreferencesProvider.inMemoryDayNightMode,
      language: PreferencesProvider.inMemoryLocale,
    ));
  }

  void changeThemeMode(ThemeMode themeMode) async {
    AppLevelVariables.currentThemeMode = themeMode;
    await PreferencesProvider.setDayNightMode(themeMode == ThemeMode.light);
    emit(AppSettings(
      themeMode: PreferencesProvider.inMemoryDayNightMode,
      language: PreferencesProvider.inMemoryLocale,
    ));
  }
}

class AppSettings {
  final ThemeMode themeMode;
  final Locale language;

  AppSettings({
    required this.themeMode,
    required this.language,
  });
}
