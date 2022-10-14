import 'package:flutter/foundation.dart';
import 'package:flutter_calendar_test/models/task_model.dart';

class DayModel {
  int day;
  List<TaskModel> tasks;
  DayModel({
    required this.day,
    required this.tasks,
  });

  DayModel copyWith({
    int? day,
    List<TaskModel>? tasks,
  }) {
    return DayModel(
      day: day ?? this.day,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  String toString() => 'DayModel(day: $day, tasks: $tasks)';

  @override
  bool operator ==(covariant DayModel other) {
    if (identical(this, other)) return true;

    return other.day == day && listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode => day.hashCode ^ tasks.hashCode;
}
