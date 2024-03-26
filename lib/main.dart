import 'package:flight_booking/Core/Constants/colors.dart';
import 'package:flight_booking/Providers/CalendarProvider/CalendarProvider.dart';
import 'package:flight_booking/Providers/CitySearchProviders/CitySearchProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/FromToProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/TripChipProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/CounterProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/ClassChipProvider.dart';
import 'package:flight_booking/Screens/ScreenSplash/ScreenSplash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TripChipProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ClassChipProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CitySearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FromToProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CalendarProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Fare Flights',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
          textTheme: const TextTheme(
              bodyLarge: TextStyle(
                color: Colors.white,
              ),
              // bodyMedium: TextStyle(
              //   color: Colors.white,
              // ),

              bodySmall: TextStyle(color: Colors.black)),
          iconButtonTheme: const IconButtonThemeData(
              style: ButtonStyle(
                  iconColor: MaterialStatePropertyAll(Colors.white))),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColor.customBlue,
            centerTitle: true,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 23,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        home: const ScreenSplash(),
      ),
    );
  }
}
