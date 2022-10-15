import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/controllers/calendar_controller.dart';
import 'package:flutter_calendar_test/models/day_model.dart';
import 'package:flutter_calendar_test/screens/day/day_screen.dart';
import 'package:get/get.dart';

class CalendarItem extends StatelessWidget {
  final DayModel item;
  final CalendarController _calendarController = Get.find<CalendarController>();
  CalendarItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (item.currentMonth) {
            Get.to(() => DayScreen(item: item));
          } else if (item.day < 10) {
            _calendarController.setNewDate(1);
          } else if (item.day > 10) {
            _calendarController.setNewDate(-1);
          }
        },
        child: Hero(
            tag: item,
            child: item.tasks.isEmpty || !item.currentMonth
                ? Center(
                    child: Text(
                      '${item.day}',
                      style: TextStyle(
                          fontSize: 16,
                          color:
                              !item.currentMonth ? Colors.grey : Colors.black),
                    ),
                  )
                : Badge(
                    badgeColor: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                    position: BadgePosition.bottomEnd(bottom: 0),
                    badgeContent: Text(
                      '${item.tasks.length}',
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                    child: Text(
                      '${item.day}',
                      style: const TextStyle(fontSize: 16),
                    ))));
  }
}
