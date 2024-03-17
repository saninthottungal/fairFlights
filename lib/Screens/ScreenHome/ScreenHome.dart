import 'package:flight_booking/Screens/ScreenHome/Widgets/InputsWidget.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/TabBarWidget.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/drawerHome.dart';
import 'package:flight_booking/Screens/ScreenHotel/ScreenHotel.dart';
import 'package:flight_booking/Screens/ScreenPassport/ScreenPassport.dart';
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
    precacheImage(const AssetImage('assets/bluebg.jpg'), context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 61, 187, 1),

        centerTitle: true,
        // APP bar Title
        title: const Text(
          "Let's Travel",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 23,
            fontStyle: FontStyle.italic,
          ),
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
                          'assets/air.png',

                          height: 250,
                          width: 250,
                          //scale: 0.6,
                        ),
                      ),
                      const BlueBackgroundWidget(),
                      const InputsWidget(),
                    ],
                  ),
                  const ScreenHotel(),
                  const Center(
                    child: Text("Visa"),
                  ),
                  const ScreenPassport()
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
