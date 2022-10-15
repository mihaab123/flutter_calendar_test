// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaskModel {
  int? id;
  DateTime date;
  String description;
  TaskModel({
    required this.id,
    required this.date,
    required this.description,
  });

  TaskModel copyWith({
    int? id,
    DateTime? date,
    String? description,
  }) {
    return TaskModel(
      id: id ?? this.id,
      date: date ?? this.date,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date.millisecondsSinceEpoch,
      'description': description,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TaskModel(id: $id, date: $date, description: $description)';

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.date == date &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ date.hashCode ^ description.hashCode;
}
