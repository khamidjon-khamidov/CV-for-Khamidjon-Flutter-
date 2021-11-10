import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

import 'base/database.dart';

enum Flavor { production, development, staging }

enum BuildType { debug, release }

class Config {
  //build modes
  static BuildType get buildType => kReleaseMode ? BuildType.release : BuildType.debug;

  static bool get isDebugMode => buildType == BuildType.debug;

  //falvors
  static Flavor? appFlavor;

  // urls
  static const BASE_URL = 'https://limitless-refuge-34453.herokuapp.com/';

  //datebase
  static Future<Database> get db => AppDatabase.instance.database;
  static const String DB_PASSWORD = "asdf23r423r0jd0";
  static const String DB_NAME = 'MY_DATABASE.db';
  static const int DB_VERSION = 5;

  static bool get showLogs {
    switch (buildType) {
      case BuildType.release:
        return false;
      case BuildType.debug:
        return true;
    }
  }

  static String get appFlavorName {
    switch (appFlavor) {
      case Flavor.production:
        return '_PROD';
      case Flavor.development:
        return '_DEV';
      case Flavor.staging:
        return '_STAGING';
      case null:
        throw Exception('Unknown appFlavor: $appFlavor');
    }
  }
}
