import 'package:flight_booking/screens/screen_home/Widgets/inputs_widget.dart';
import 'package:flight_booking/screens/screen_home/Widgets/tab_bar_widget.dart';
import 'package:flight_booking/screens/screen_home/Widgets/drawer_home.dart';
import 'package:flight_booking/screens/screen_passport/screen_passport.dart';
import 'package:flight_booking/screens/screen_support/screen_support.dart';
import 'package:flight_booking/screens/screen_visa/screen_visa.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 240, 242),
      appBar: AppBar(
        title: const Text(
          "fairflights",
        ),
      ),

      // Tabs
      body: Column(
        children: [
          TabBarWidget(tabController: tabController),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: TabBarView(
                controller: tabController,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        left: 65,
                        child: Image.asset(
                          'assets/images/air.png',

                          height: 250,
                          width: 250,
                          //scale: 0.6,
                        ),
                      ),
                      const BlueBackgroundWidget(),
                      InputsWidget(),
                    ],
                  ),
                  const ScreenSupport(),
                  const ScreenPassport(),
                  const ScreenVisa(),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: const DrawerHome(),
    );
  }
}

class BlueBackgroundWidget extends StatelessWidget {
  final double? radius;
  const BlueBackgroundWidget({
    super.key,
    this.radius = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(20, 61, 187, 0.9),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius!),
          bottomRight: Radius.circular(radius!),
        ),
      ),
    );
  }
}
