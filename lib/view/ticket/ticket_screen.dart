import 'package:flight_booking/view/colors.dart';
import 'package:flight_booking/view/ticket/widget/app_bar_title.dart';
import 'package:flight_booking/view/ticket/widget/date_picker_widget.dart';
import 'package:flight_booking/view/ticket/widget/ticker_card.dart';
import 'package:flutter/material.dart';

class ViewTickets extends StatelessWidget {
  const ViewTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.blue,
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
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: DatePickerWidget(),
          ),
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
