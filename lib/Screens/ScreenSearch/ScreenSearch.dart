import 'package:flight_booking/Core/Constants/enums.dart';
import 'package:flight_booking/Core/Widgets/CustomSnackbar.dart';
import 'package:flight_booking/Providers/CitySearchProviders/CitySearchProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/FromToProvider.dart';
import 'package:flight_booking/Services/Api/CitySearch/CitySearch.dart';
import 'package:flight_booking/Services/Connectivty/CheckConnectivty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  final fromController = TextEditingController();
  final toController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final toFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //from searchfield

            CupertinoSearchTextField(
              prefixIcon: const Icon(Icons.flight_takeoff),
              padding: const EdgeInsets.all(12),
              placeholder: 'Origin',
              controller: fromController,
              onTap: () async {
                final value =
                    await CheckNetConnectivity().checknetConnectivity();
                if (!value) {
                  CustomSnackbar.show(
                    context: scaffoldKey.currentContext!,
                    message: "No Network Connection",
                  );
                }
                Provider.of<FromToProvider>(scaffoldKey.currentContext!,
                        listen: false)
                    .selectedField = SelectedField.fromField;
              },
              onChanged: (value) async {
                final provider =
                    Provider.of<CitySearchProvider>(context, listen: false);
                provider.setFirstLoading = false;
                provider.loading = true;
                provider.isEmpty = false;
                if (value.trim().isEmpty) {
                  provider.loading = false;
                  return;
                } else {
                  final cities = await searchCities(value);
                  if (cities.isEmpty) {
                    provider.setEmpty = true;
                  }
                  provider.updateCities = cities;
                  provider.loading = false;
                }
              },
            ),
            const SizedBox(height: 10),

            //to searchfield
            CupertinoSearchTextField(
              padding: const EdgeInsets.all(12),
              prefixIcon: const Icon(Icons.flight_land),
              //itemColor: AppColor.customBlue,
              placeholder: 'Destination',
              controller: toController,
              focusNode: toFocusNode,
              onTap: () async {
                final value =
                    await CheckNetConnectivity().checknetConnectivity();
                if (!value) {
                  CustomSnackbar.show(
                    context: scaffoldKey.currentContext!,
                    message: "No Network Connection",
                  );
                }
                Provider.of<FromToProvider>(scaffoldKey.currentContext!,
                        listen: false)
                    .selectedField = SelectedField.toField;
              },
              onChanged: (value) async {
                final provider = Provider.of<CitySearchProvider>(
                    scaffoldKey.currentContext!,
                    listen: false);
                provider.setFirstLoading = false;
                provider.loading = true;
                provider.isEmpty = false;

                if (value.trim().isEmpty) {
                  provider.loading = false;
                  return;
                } else {
                  final cities = await searchCities(value);
                  if (cities.isEmpty) {
                    provider.setEmpty = true;
                  }
                  provider.updateCities = cities;
                  provider.loading = false;
                }
              },
            ),
            const SizedBox(height: 10),
            const Divider(height: 25),

            Consumer<CitySearchProvider>(builder: (context, provider, _) {
              return Visibility(
                visible: provider.isLoading,
                child: const SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                ),
              );
            }),

            //listview separated
            Consumer<CitySearchProvider>(builder: (context, cityProvider, _) {
              if (cityProvider.isEmpty) {
                return const Text(
                  "List is empty",
                  style: TextStyle(color: Colors.black),
                );
              } else if (cityProvider.firstLoading) {
                return const Text(
                  "Search a City",
                  style: TextStyle(color: Colors.black),
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final city = cityProvider.cites[index];
                      bool isCity = true;
                      if (city.type == 'city') {
                        isCity = true;
                      } else {
                        isCity = false;
                      }
                      final mainAirport =
                          city.name ?? city.mainAirportName ?? '';
                      final cityAirport = city.mainAirportName ?? "Any Airport";

                      return ListTile(
                        leading: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade100,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            city.code ?? "",
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          )),
                        ),
                        title: Text(
                          isCity ? city.name ?? '' : city.cityName ?? '',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(isCity ? cityAirport : mainAirport),
                        onTap: () {
                          final fromtoProvider = Provider.of<FromToProvider>(
                              context,
                              listen: false);
                          final cityProvider = Provider.of<CitySearchProvider>(
                              context,
                              listen: false);

                          if (fromtoProvider.selectedField ==
                              SelectedField.fromField) {
                            FocusScope.of(context).requestFocus(toFocusNode);
                            fromtoProvider.changeSelectedField =
                                SelectedField.toField;

                            // cityProvider.updateCities = [];
                            cityProvider.setFirstLoading = true;
                            fromtoProvider.changeFromValue = city;

                            if (city.countryName != null) {
                              fromController.text =
                                  isCity ? city.name! : city.cityName!;
                            }
                          } else {
                            fromtoProvider.changeToValue = city;
                            if (city.name != null) {
                              fromController.text =
                                  isCity ? city.name! : city.cityName!;
                            }
                            fromController.dispose();
                            toController.dispose();
                            Navigator.of(context).pop();
                            Provider.of<CitySearchProvider>(context,
                                    listen: false)
                                .setFirstLoading = true;
                          }
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 15);
                    },
                    itemCount: cityProvider.cites.length,
                  ),
                );
              }
            }),
          ],
        ),
      )),
    );
  }
}
