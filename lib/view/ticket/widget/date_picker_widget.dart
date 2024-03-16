import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: EasyInfiniteDateTimeLine(
        showTimelineHeader: false,
        firstDate: DateTime.now(),
        focusDate: DateTime.now(),
        lastDate: DateTime.now().add(
          const Duration(days: 60),
        ),
        dayProps: EasyDayProps(
          width: 55,
          activeDayStyle: DayStyle(
            borderRadius: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.white.withOpacity(0.4)),
              color: Colors.transparent,
            ),
          ),
          inactiveDayStyle: DayStyle(
            borderRadius: 4,
            dayStrStyle: const TextStyle(color: Colors.white),
            monthStrStyle: const TextStyle(color: Colors.white),
            dayNumStyle: const TextStyle(color: Colors.white),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.white.withOpacity(0.4)),
              color: Colors.transparent,
            ),
          ),
          landScapeMode: true,
        ),
      ),
    );
  }
}
