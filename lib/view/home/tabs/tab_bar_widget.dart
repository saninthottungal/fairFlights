import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      dividerColor: Colors.transparent,
      indicatorColor: Colors.white,
      unselectedLabelStyle: const TextStyle(
        color: Color.fromRGBO(105, 143, 241, 1),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      labelColor: Colors.white,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      tabs: const [
        Tab(
          text: "Flights",
        ),
        Tab(
          text: "Hotel",
        ),
        Tab(
          text: "Visa",
        ),
        Tab(
          text: "Passport",
        ),
      ],
    );
  }
}
