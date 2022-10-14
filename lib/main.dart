import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/controllers/calendar_controller.dart';
import 'package:flutter_calendar_test/screens/calendar/calendar_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final CalendarController _calendarController = Get.put(CalendarController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Calendar Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CalendarScreen());
  }
}
