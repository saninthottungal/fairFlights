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
      labelStyle: const TextStyle(fontWeight: FontWeight.w900),

      // isScrollable: true,
      controller: tabController,
      tabAlignment: TabAlignment.fill,
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
      ),
      tabs: [
        const Tab(
          icon: Icon(Icons.flight),
          iconMargin: EdgeInsets.all(0),
          text: 'Flights',
        ),
        const Tab(
          icon: Icon(Icons.support_agent),
          iconMargin: EdgeInsets.all(0),
          text: 'Support',
        ),
        const Tab(
          icon: Icon(Icons.credit_card),
          iconMargin: EdgeInsets.all(0),
          text: 'Visa',
        ),
        Tab(
          icon: Image.asset(
            'assets/passicon.png',
            height: 26,
            width: 24,
          ),
          iconMargin: const EdgeInsets.all(0),
          text: 'Passport',
        ),
      ],
    );
  }
}
