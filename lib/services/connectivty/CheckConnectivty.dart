import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flight_booking/services/exception/network_exceptions.dart';
import 'package:get_ip_address/get_ip_address.dart';

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
    dynamic ipAddress;
    try {
      ipAddress = await IpAddress().getIpAddress();

      return ipAddress;
    } catch (_) {
      throw Network404Exception();
    }
  }
}
