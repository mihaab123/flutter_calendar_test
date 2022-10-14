import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/models/task_model.dart';

class TaskListItem extends StatelessWidget {
  final TaskModel task;
  const TaskListItem({Key? key, required this.task}) : super(key: key);

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
                  task.description,
                  style: const TextStyle(fontSize: 16),
                ),
              )),
        ),
      ),
    );
  }
}
