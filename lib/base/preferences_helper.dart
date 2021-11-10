import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesHelper {
  static Future<String?> getString(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> setString(String key, String? value) async {
    var prefs = await SharedPreferences.getInstance();
    if (value == null) {
      prefs.remove(key);
    } else {
      await prefs.setString(key, value);
    }
  }

  static Future<int?> getInt(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static Future<void> setInt(String key, int? value) async {
    var prefs = await SharedPreferences.getInstance();
    if (value == null) {
      prefs.remove(key);
    } else {
      await prefs.setInt(key, value);
    }
  }

  static Future<bool?> getBool(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future<void> setBool(String key, bool? value) async {
    var prefs = await SharedPreferences.getInstance();
    if (value == null) {
      prefs.remove(key);
    } else {
      await prefs.setBool(key, value);
    }
  }
}
