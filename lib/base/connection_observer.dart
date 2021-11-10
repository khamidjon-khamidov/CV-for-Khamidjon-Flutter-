import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectionObserver {
  static Stream<bool> get onChanged => Connectivity()
      .onConnectivityChanged
      .map((status) => status != ConnectivityResult.none)
      .skip(1);
}
