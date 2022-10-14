// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaskModel {
  DateTime date;
  String description;
  TaskModel({
    required this.date,
    required this.description,
  });

  TaskModel copyWith({
    DateTime? date,
    String? description,
  }) {
    return TaskModel(
      date: date ?? this.date,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
      'description': description,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TaskModel(date: $date, description: $description)';

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.date == date && other.description == description;
  }

  @override
  int get hashCode => date.hashCode ^ description.hashCode;
}
