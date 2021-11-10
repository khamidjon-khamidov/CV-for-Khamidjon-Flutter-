import 'package:cv_for_khamidjon/base/preferences_helper.dart';
import 'package:cv_for_khamidjon/utils/constants.dart';

abstract class PreferencesProvider {
  static Future<String?> getLanguage() => PreferencesHelper.getString(AppConstants.LANGUAGE_KEY);

  static Future<void> setLanguage(String? language) async {
    if (language != null) await PreferencesHelper.setString(AppConstants.LANGUAGE_KEY, language);
  }

  static Future<String?> getDayNightMode() =>
      PreferencesHelper.getString(AppConstants.DAY_NIGHT_MODE_KEY);

  static Future<void> setDayNightMode(String? dayNightMode) async {
    if (dayNightMode != null)
      await PreferencesHelper.setString(AppConstants.LANGUAGE_KEY, dayNightMode);
  }
}
