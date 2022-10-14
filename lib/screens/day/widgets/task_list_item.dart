import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/controllers/calendar_controller.dart';
import 'package:flutter_calendar_test/models/task_model.dart';
import 'package:flutter_calendar_test/services/date_service.dart';
import 'package:get/get.dart';

class TaskListItem extends StatelessWidget {
  final itemIndex;
  final TaskModel task;
  final CalendarController _calendarController = Get.find<CalendarController>();
  TaskListItem({Key? key, required this.task, required this.itemIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Dismissible(
        key: ObjectKey(task),
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerLeft,
          child: const Icon(Icons.delete),
        ),
        secondaryBackground: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          child: const Icon(Icons.delete),
        ),
        onDismissed: (direction) {
          _calendarController.deleteTaskFromDatabase(itemIndex, task);
        },
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width - 16),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: Text(
                  "${getTime(task.date)} - ${task.description}",
                  style: const TextStyle(fontSize: 16),
                ),
              )),
        ),
      ),
    );
  }
}
