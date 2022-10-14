import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/controllers/calendar_controller.dart';
import 'package:flutter_calendar_test/screens/calendar/widgets/calendar_action.dart';
import 'package:flutter_calendar_test/screens/calendar/widgets/calendar_header.dart';
import 'package:flutter_calendar_test/screens/calendar/widgets/calendar_view.dart';
import 'package:get/get.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Calendar Test"),
        ),
        body: Column(
          children: [
            CalendarAction(),
            const CalendarHeader(),
            CalendarView(),
          ],
        ),
      ),
    );
  }
}
