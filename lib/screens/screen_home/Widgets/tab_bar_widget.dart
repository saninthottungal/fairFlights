import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
    return TabBar(
      labelPadding: EdgeInsets.symmetric(horizontal: widht * 0.03),
      labelStyle: const TextStyle(fontWeight: FontWeight.w900),
      controller: tabController,
      isScrollable: true,
      tabAlignment: TabAlignment.center,
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
      ),
      tabs: [
        const Tab(
          child: Row(
            children: [Icon(Icons.flight), Text("Flights")],
          ),
        ),
        const Tab(
          child: Row(
            children: [Icon(Icons.support_agent), Text("Support")],
          ),
        ),
        Tab(
          child: Row(
            children: [
              Image.asset('assets/images/passicon.png', height: 26, width: 24),
              const Text("Passport")
            ],
          ),
        ),
        const Tab(
          child: Row(
            children: [Icon(Icons.badge_outlined), Text("Visa")],
          ),
        ),
      ],
    );
  }
}
