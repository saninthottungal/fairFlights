import 'package:flight_booking/view/home/tabs/hotel_tab/hotel_tab.dart';
import 'package:flight_booking/view/home/tabs/passport_tab/passport_tab.dart';
import 'package:flight_booking/view/home/widgets/drawerHome.dart';
// import 'package:flight_booking/view/home/widgets/drawer_widgets.txt';
import 'package:flight_booking/view/home/widgets/inputs_widget.dart';
import 'package:flight_booking/view/home/tabs/tab_bar_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/bluebg.jpg'), context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 61, 187, 1),
        // Hamburger Menu button

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
        // Tab Bar Widget
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: TabBarWidget(
            tabController: tabController,
          ),
        ),
      ),
      // Tabs
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: TabBarView(
          controller: tabController,
          children: [
            Stack(
              children: [
                Image.asset('assets/air.png'),
                const BlueBackgroundWidget(),
                const InputsWidget(),
              ],
            ),
            const HotelTabWidget(),
            const Center(
              child: Text("Visa"),
            ),
            const PassportTab()
          ],
        ),
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
