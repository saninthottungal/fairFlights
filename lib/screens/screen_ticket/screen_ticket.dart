import 'package:flight_booking/core/constants/colors.dart';
import 'package:flight_booking/screens/screen_ticket/widgets/app_bar_title.dart';
import 'package:flight_booking/screens/screen_ticket/widgets/ticker_card.dart';
import 'package:flutter/material.dart';

class ScreenTickets extends StatelessWidget {
  const ScreenTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.customBlue,
          title: const AppBarTitle(),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.share,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(4),
          children: List.generate(
            10,
            (index) {
              return const TicketCard();
            },
          ),
        ));
  }
}
