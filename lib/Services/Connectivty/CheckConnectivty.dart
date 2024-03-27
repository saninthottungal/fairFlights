import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flight_booking/Services/Exception/NetworkExceptions.dart';
import 'package:network_info_plus/network_info_plus.dart';

class CheckNetConnectivity {
  Future<bool> checknetConnectivity() async {
    try {
      final List<ConnectivityResult> connectivtyResult =
          await (Connectivity().checkConnectivity());

      if (connectivtyResult.contains(ConnectivityResult.none)) {
        return false;
      } else {
        return true;
      }
    } catch (_) {
      throw NetworkException();
    }
  }

  Future<void> getIpAddress() async {
    final networkInfo = NetworkInfo();
    String? ipAddress;
    try {
      ipAddress = await networkInfo.getWifiIP();
      print(ipAddress);
    } catch (_) {
      throw NetworkException();
    }
  }
}
