import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/providers/calendar_provider/calendar_provider.dart';
import 'package:flight_booking/screens/screen_calendar/widgets/custom_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class ScreenCalendar extends StatelessWidget {
  const ScreenCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<CalendarProvider>().isDepartureWay
            ? 'Departure Date'
            : 'Return Date'),
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
              calendarController: CleanCalendarController(
                minDate: DateTime.now(),
                maxDate: DateTime.now().add(const Duration(days: 365 * 3)),
                rangeMode: false,
                initialDateSelected:
                    Provider.of<CalendarProvider>(context, listen: false)
                        .departureDate,
                onDayTapped: (date) async {
                  final provider =
                      Provider.of<CalendarProvider>(context, listen: false);
                  if (provider.way == TripWay.departureWay) {
                    if (date.isAfter(provider.returnDate)) {
                      provider.changeDepartureDate = date;
                      provider.changeReturnDate = date;
                    } else {
                      provider.changeDepartureDate = date;
                    }
                  } else {
                    if (date.isBefore(provider.departureDate)) {
                      provider.changeReturnDate = provider.departureDate;
                    } else {
                      provider.changeReturnDate = date;
                    }
                  }
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Navigator.of(context).pop();
                  });
                },
              ),
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
