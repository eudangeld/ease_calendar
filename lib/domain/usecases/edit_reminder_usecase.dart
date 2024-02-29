import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../core/index.dart';
import '../entities/index.dart';
import '../repositories/index.dart';

class EditReminderUseCase
    implements AsyncUseCase<Reminder, EditReminderParams> {
  final RemindersRepository repositorie;

  EditReminderUseCase(this.repositorie);

  @override
  Future<Either<Failure, Reminder>> call(EditReminderParams params) async {
    return await repositorie.editReminder(params);
  }
}

class EditReminderParams {
  String? token;
  String id;
  String title;
  String description;
  String date;
  String color;

  EditReminderParams({
    required this.id,
    this.token,
    required this.title,
    required this.description,
    required this.date,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'color': color,
    };
  }

  factory EditReminderParams.fromMap(Map<String, dynamic> map) {
    return EditReminderParams(
      token: map['token'] as String,
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      color: map['color'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EditReminderParams.fromJson(String source) =>
      EditReminderParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
