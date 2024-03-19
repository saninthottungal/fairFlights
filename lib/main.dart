import 'package:flight_booking/Screens/ScreenHome/Providers/ChoiceProvider.dart';
import 'package:flight_booking/Screens/ScreenHome/Providers/CounterProvider.dart';
import 'package:flight_booking/Screens/ScreenHome/Providers/CustomChipProvider.dart';
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
          create: (context) => ChoiceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomChipProvider(),
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
              bodyMedium: TextStyle(
                color: Colors.white,
              )),
          iconButtonTheme: const IconButtonThemeData(
              style: ButtonStyle(
                  iconColor: MaterialStatePropertyAll(Colors.white))),
          useMaterial3: true,
        ),
        home: const ScreenSplash(),
      ),
    );
  }
}
