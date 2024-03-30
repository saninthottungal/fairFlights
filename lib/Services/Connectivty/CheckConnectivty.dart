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
      throw Network404Exception();
    }
  }

  Future<String?> getIpAddress() async {
    final networkInfo = NetworkInfo();
    String? ipAddress;
    try {
      ipAddress = await networkInfo.getWifiIP();
      return ipAddress;
    } catch (_) {
      throw Network404Exception();
    }
  }
}
