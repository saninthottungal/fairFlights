import 'package:firebase_core/firebase_core.dart';
import 'package:flight_booking/core/constants/colors.dart';
import 'package:flight_booking/providers/agency_provider.dart';
import 'package:flight_booking/providers/auth_service_provider/auth_mode_provider.dart';
import 'package:flight_booking/providers/auth_service_provider/auth_service_provider.dart';
import 'package:flight_booking/providers/auth_service_provider/pass_provider.dart';
import 'package:flight_booking/providers/auth_service_provider/timer_provider.dart';
import 'package:flight_booking/providers/calendar_provider/calendar_provider.dart';
import 'package:flight_booking/providers/city_search_provider/city_search_provider.dart';
import 'package:flight_booking/providers/firestore_provider/firestore_provider.dart';
import 'package:flight_booking/providers/flight_providers/data_loading_provider.dart';
import 'package:flight_booking/providers/flight_providers/flight_data_provider.dart';
import 'package:flight_booking/providers/flight_providers/sort_provider.dart';
import 'package:flight_booking/providers/home_providers/from_to_provider.dart';
import 'package:flight_booking/providers/home_providers/traveller_class_provider.dart';
import 'package:flight_booking/providers/home_providers/trip_chip_provider.dart';
import 'package:flight_booking/providers/home_providers/counter_provider.dart';
import 'package:flight_booking/providers/home_providers/class_chip_provider.dart';
import 'package:flight_booking/providers/web_view_provider/web_view_provider.dart';
import 'package:flight_booking/screens/screen_calendar/screen_calendar.dart';
import 'package:flight_booking/screens/screen_flights_list/screen_flights_list.dart';
import 'package:flight_booking/screens/screen_home/screen_home.dart';
import 'package:flight_booking/screens/screen_auth/screen_auth.dart';
import 'package:flight_booking/screens/screen_login/screen_login.dart';
import 'package:flight_booking/screens/screen_mail_verify/screen_mail_verify.dart';
import 'package:flight_booking/screens/screen_reset_password/screen_reset_password.dart';
import 'package:flight_booking/screens/screen_search/screen_search.dart';
import 'package:flight_booking/screens/screen_splash/screen_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ),
        ChangeNotifierProvider(
          create: (context) => AgencyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthModeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthServiceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PassProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TimerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FirestoreProvider(),
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
                fontFamily: 'customFont',
              ),
              bodyMedium: TextStyle(
                fontFamily: 'customFont',
              ),
              bodySmall: TextStyle(
                color: Colors.black,
                fontFamily: 'customFont',
              )),
          iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(
              iconColor: MaterialStatePropertyAll(Colors.white),
            ),
          ),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColor.customBlue,
            centerTitle: true,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'customFont',
              letterSpacing: 1,
            ),
          ),
        ),
        routes: {
          '/splash': (context) => const ScreenSplash(),
          '/home': (context) => const ScreenHome(),
          '/search': (context) => ScreenSearch(),
          '/flightsList': (context) => const ScreenFlightsList(),
          '/calendar': (context) => const ScreenCalendar(),
          '/auth': (context) => const ScreenAuth(),
          '/login': (context) => ScreenLogin(),
          '/mail': (context) => const ScreenMailVerify(),
          '/reset': (context) => ScreenRestPassword(),
        },
        home: const ScreenSplash(),
      ),
    );
  }
}
