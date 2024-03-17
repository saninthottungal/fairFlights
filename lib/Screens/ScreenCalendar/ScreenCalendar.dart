import 'package:flight_booking/Core/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class ScreenCalendar extends StatelessWidget {
  const ScreenCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.customBlue,
        title: const Text(
          "Pick a journey Date",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                week.length,
                (index) {
                  final weekInt = week[index];
                  return SizedBox(
                    width: 40,
                    child: Text(
                      weekInt,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: PagedVerticalCalendar(
          minDate: DateTime.now(),
          maxDate: DateTime.now().add(const Duration(days: 365)),
          initialDate: DateTime.now().add(const Duration(days: 3)),
          monthBuilder: (context, month, year) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    DateFormat()
                        .add_yMMMM()
                        .format(
                          DateTime.now(),
                        )
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          },
          dayBuilder: (context, date) {
            Color cellColor = Colors.white;

            // Check if the date is the highest or lowest
            if (getHighestDates().contains(date)) {
              cellColor = const Color.fromRGBO(235, 252, 234, 1);
            } else if (getLowestDates().contains(date)) {
              cellColor = const Color.fromRGBO(254, 245, 228, 1);
            }

            return InkWell(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: cellColor,
                  ),
                  height: 40,
                  width: 40,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          date.day.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          cellColor == const Color.fromRGBO(235, 252, 234, 1) ||
                                  cellColor ==
                                      const Color.fromRGBO(254, 245, 228, 1)
                              ? "72000"
                              : '...',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<DateTime> getHighestDates() {
    // Replace this with your logic to get multiple highest dates
    return [
      DateTime(2024, 3, 29),
      DateTime(2024, 3, 22),
      DateTime(2024, 3, 8),
      DateTime(2024, 3, 6),
      DateTime(2024, 3, 24),
      DateTime(2024, 3, 14),
      DateTime(2024, 4, 1),
      DateTime(2024, 4, 19),
      DateTime(2024, 4, 11),
      DateTime(2024, 4, 10),
    ];
  }

  List<DateTime> getLowestDates() {
    // Replace this with your logic to get multiple lowest dates
    return [
      DateTime(2024, 3, 5),
      DateTime(2024, 3, 1),
      DateTime(2024, 3, 19),
      DateTime(2024, 3, 11),
      DateTime(2024, 3, 10),
      DateTime(2024, 3, 17),
      DateTime(2024, 3, 26),
      DateTime(2024, 3, 21),
      DateTime(2024, 4, 8),
      DateTime(2024, 4, 6),
      DateTime(2024, 4, 24),
    ];
  }

  List<DateTime> getSpecialDates() {
    // Combine the lists of highest and lowest dates
    return [...getHighestDates(), ...getLowestDates()];
  }
}
