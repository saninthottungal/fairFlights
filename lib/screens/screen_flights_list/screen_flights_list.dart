import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/models/flight_list_model.dart';
import 'package:flight_booking/providers/flight_providers/data_loading_provider.dart';
import 'package:flight_booking/providers/flight_providers/flight_data_provider.dart';
import 'package:flight_booking/providers/home_providers/trip_chip_provider.dart';
import 'package:flight_booking/screens/screen_flight/screen_flight.dart';
import 'package:flight_booking/screens/screen_flights_list/widgets/app_bar.dart';
import 'package:flight_booking/screens/screen_flights_list/widgets/custom_modale.dart';
import 'package:flight_booking/screens/screen_flights_list/widgets/exception_widget.dart';
import 'package:flight_booking/screens/screen_flights_list/widgets/loading_widget.dart';
import 'package:flight_booking/screens/screen_flights_list/widgets/trip_data_Widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flight_booking/core/constants/colors.dart';

class ScreenFlightsList extends StatelessWidget {
  const ScreenFlightsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataLoadingProvider>(builder: (context, flightProvider, _) {
      return flightProvider.isExceptionThrown
          ? const ExceptionWidget()
          : flightProvider.isLoading
              ? const IsLoadingWidget()
              : Scaffold(
                  backgroundColor: const Color.fromARGB(255, 238, 240, 242),
                  appBar: CustomAppBar(
                    onPressed: () async {
                      showModalBottomSheet(
                          context: context,
                          builder: (ctx) {
                            return const CustomModaleWidget();
                          });
                    },
                  ),
                  body: SafeArea(
                    child: Consumer<FlightDataProvider>(
                        builder: (context, provider, _) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            //proposals per index
                            final proposal = provider.proposals[index];
                            //triptype
                            final TripType tripType =
                                Provider.of<TripChipProvider>(context,
                                        listen: false)
                                    .value;

                            FlightListModel oneWay =
                                FlightListModel.fromFlightDataModel(
                              proposal: proposal,
                              tripType: tripType,
                              tripWay: TripWay.departureWay,
                            );

                            FlightListModel? roundWay =
                                tripType == TripType.oneWay
                                    ? null
                                    : FlightListModel.fromFlightDataModel(
                                        proposal: proposal,
                                        tripType: tripType,
                                        tripWay: TripWay.returnWay,
                                      );

                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ScreenFlight(proposal: proposal)));
                              },
                              child: Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //price

                                            Text(
                                              '\u20B9${oneWay.price}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.customBlue,
                                                fontSize: 20,
                                              ),
                                            ),

                                            //logo

                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage: NetworkImage(
                                                "http://pics.avs.io/250/250/${proposal.segment?.first.flight?.first.operatedBy ?? proposal.segment?.first.flight?.first.operatingCarrier}.png",
                                                scale: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        TripDataWidget(
                                          flightModel: oneWay,
                                        ),
                                        tripType == TripType.oneWay
                                            ? const SizedBox(
                                                width: 0, height: 0)
                                            : const SizedBox(height: 20),
                                        tripType == TripType.oneWay
                                            ? const SizedBox(
                                                width: 0, height: 0)
                                            : TripDataWidget(
                                                flightModel: roundWay,
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 4);
                          },
                          itemCount: provider.numberOfProposals,
                        ),
                      );
                    }),
                  ));
    });
  }
}
