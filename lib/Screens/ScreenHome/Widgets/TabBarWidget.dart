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
      isScrollable: true,
      controller: tabController,
      tabAlignment: TabAlignment.center,
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
      ),
      tabs: const [
        Tab(
          child: Row(
            children: [
              Icon(
                Icons.flight,
                size: 15,
              ),
              Text("Flights")
            ],
          ),
        ),
        Tab(
          child: Row(
            children: [
              Icon(
                Icons.bed,
                size: 15,
              ),
              Text("Hotels")
            ],
          ),
        ),
        Tab(
          child: Row(
            children: [
              Icon(
                Icons.credit_card,
                size: 15,
              ),
              Text("Visa")
            ],
          ),
        ),
        Tab(
          child: Row(
            children: [
              Icon(
                Icons.library_books,
                size: 15,
              ),
              Text("Passport")
            ],
          ),
        ),
      ],
    );
  }
}
