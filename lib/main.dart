import 'package:flight_booking/Core/Constants/colors.dart';
import 'package:flight_booking/Providers/CalendarProvider/CalendarProvider.dart';
import 'package:flight_booking/Providers/CitySearchProviders/CitySearchProvider.dart';
import 'package:flight_booking/Providers/FlightProviders/DataLoadingProvider.dart';
import 'package:flight_booking/Providers/FlightProviders/FlightDataProvider.dart';
import 'package:flight_booking/Providers/FlightProviders/SortProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/FromToProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/TravellerClassProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/TripChipProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/CounterProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/ClassChipProvider.dart';
import 'package:flight_booking/Providers/WebViewProvider/WebViewProvider.dart';
import 'package:flight_booking/Screens/ScreenSplash/ScreenSplash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await dotenv.load(fileName: '.env');
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        ChangeNotifierProvider(
          create: (context) => TravellerClassProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FlightDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DataLoadingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SortProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WebViewProvider(),
        )
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
