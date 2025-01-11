// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> hasConnection() async {
  List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
  bool connected = true;
  connectivityResult.forEach((connection) {
    if (connection == ConnectivityResult.none) {
      connected = false;
    }
  });
  return connected;
}
