import 'package:flight_booking/Screens/ScreenCalendar/Widgets/CustomRow.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class ScreenCalendar extends StatelessWidget {
  ScreenCalendar({super.key});

  final calendarController = CleanCalendarController(
      minDate: DateTime.now(),
      maxDate: DateTime.now().add(
        const Duration(days: 365 * 3),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Departure Date"),
        centerTitle: false,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRow(title: 'lowest', color: Colors.green),
                CustomRow(title: 'average', color: Colors.grey),
                CustomRow(title: 'highest', color: Colors.red),
              ],
            ),
          ),
          Expanded(
            child: ScrollableCleanCalendar(
              calendarController: calendarController,
              layout: Layout.DEFAULT,
              calendarCrossAxisSpacing: 0,
              showWeekdays: true,
              calendarMainAxisSpacing: 0,
              spaceBetweenMonthAndCalendar: 10,
              spaceBetweenCalendars: 35,
              weekdayTextStyle: const TextStyle(
                color: Colors.black38,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
