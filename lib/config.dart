import 'package:flutter/foundation.dart';

enum Flavor { production, development, staging }

enum BuildType { debug, release }

class Config {
  //build modes
  static BuildType get buildType => kReleaseMode ? BuildType.release : BuildType.debug;

  static bool get isDebugMode => buildType == BuildType.debug;

  //falvors
  static Flavor? appFlavor;

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
