import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flight_booking/Services/Exception/NetworkExceptions.dart';

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
}
