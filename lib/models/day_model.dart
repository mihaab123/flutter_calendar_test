// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_calendar_test/models/task_model.dart';

class DayModel {
  int day;
  bool currentMonth;
  List<TaskModel> tasks;
  DayModel({
    required this.day,
    required this.currentMonth,
    required this.tasks,
  });

  DayModel copyWith({
    int? day,
    bool? currentMonth,
    List<TaskModel>? tasks,
  }) {
    return DayModel(
      day: day ?? this.day,
      currentMonth: currentMonth ?? this.currentMonth,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  String toString() =>
      'DayModel(day: $day, currentMonth: $currentMonth, tasks: $tasks)';

  @override
  bool operator ==(covariant DayModel other) {
    if (identical(this, other)) return true;

    return other.day == day &&
        other.currentMonth == currentMonth &&
        listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode => day.hashCode ^ currentMonth.hashCode ^ tasks.hashCode;
}
