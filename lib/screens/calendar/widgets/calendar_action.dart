import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/controllers/calendar_controller.dart';
import 'package:flutter_calendar_test/services/date_service.dart';
import 'package:get/get.dart';

class CalendarAction extends StatelessWidget {
  final CalendarController _calendarController = Get.find<CalendarController>();
  CalendarAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                _calendarController.setNewDate(_calendarController
                    .currentMonthStart.value
                    .add(const Duration(days: -30)));
              },
              icon: const Icon(Icons.arrow_back_ios)),
          GetBuilder<CalendarController>(
            builder: (_) => Text(
              getMonthName(_calendarController.currentMonthStart.value),
              style: const TextStyle(fontSize: 20),
            ),
          ),
          IconButton(
              onPressed: () {
                _calendarController.setNewDate(_calendarController
                    .currentMonthStart.value
                    .add(const Duration(days: 30)));
              },
              icon: const Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}
