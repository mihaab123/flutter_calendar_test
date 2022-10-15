import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/services/constants.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          7,
          (index) => Text(
            weekDays[index],
            style: const TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
