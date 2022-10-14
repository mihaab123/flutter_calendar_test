import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/controllers/calendar_controller.dart';
import 'package:flutter_calendar_test/screens/calendar/widgets/calendar_item.dart';
import 'package:get/get.dart';

class CalendarView extends StatelessWidget {
  final CalendarController _calendarController = Get.find<CalendarController>();
  CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.75,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemCount: _calendarController.daysOfMonth.length,
          itemBuilder: (BuildContext context, int index) {
            return CalendarItem(item: _calendarController.daysOfMonth[index]);
          }),
    );
  }
}
