import 'package:flight_booking/Core/Widgets/CustomSnackbar.dart';
import 'package:flight_booking/Providers/FlightProviders/FlightDataProvider.dart';
import 'package:flight_booking/Services/Exception/NetworkExceptions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class IsLoadingWidget extends StatelessWidget {
  const IsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final dataProvider =
          Provider.of<FlightDataProvider>(context, listen: false);
      try {
        await dataProvider.getFlightData(context);
      } on Network404Exception catch (_) {
        CustomSnackbar.show(
            context: context, message: "Network connection Lost.");
      } on MarkerNotFoundException catch (_) {
        CustomSnackbar.show(
            context: context, message: "couldn't load app components.");
      } on PassengersNotFoundException catch (_) {
        CustomSnackbar.show(
            context: context, message: "passengers details not found.");
      } on SegmentsErrorException catch (_) {
        CustomSnackbar.show(
            context: context, message: "Internal Error, contact dev.");
      } on UserIpNotFoundException catch (_) {
        CustomSnackbar.show(
            context: context,
            message: "Could't fetch IP Address, try again later.");
      } on ApiKeyNotFoundException catch (_) {
        CustomSnackbar.show(
            context: context, message: "couldn't load app components.");
      } on SignatureFormationException catch (_) {
        CustomSnackbar.show(
            context: context, message: "couldn't load app components.");
      } on SearchIdNotFoundException catch (_) {
        CustomSnackbar.show(
            context: context, message: "couldn't form a request. try later.");
      } on DioRequestException catch (_) {
        CustomSnackbar.show(
            context: context, message: "Network connection timed out.");
      } on GenericException catch (_) {
        CustomSnackbar.show(
            context: context, message: "Internal Error, contact dev.");
      } catch (_) {
        CustomSnackbar.show(
            context: context, message: "Internal Error, contact dev.");
      }
      Navigator.of(context).pop();
    });
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            LottieBuilder.asset(
              'assets/loading.json',
              height: height * 0.7,
              width: width * 0.7,
            ),
            Consumer<FlightDataProvider>(builder: (context, provider, _) {
              return Text(
                provider.loadingText,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
