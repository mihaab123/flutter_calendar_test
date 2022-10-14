import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/models/day_model.dart';
import 'package:flutter_calendar_test/screens/day/day_screen.dart';
import 'package:get/get.dart';

class CalendarItem extends StatelessWidget {
  final DayModel item;
  const CalendarItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Get.to(DayScreen(item: item)),
        child: Hero(
            tag: item.day,
            child: item.tasks.isEmpty
                ? Text(
                    '${item.day}',
                    style: const TextStyle(fontSize: 16),
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