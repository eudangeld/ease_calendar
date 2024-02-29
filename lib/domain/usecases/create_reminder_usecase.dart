import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../core/index.dart';
import '../entities/index.dart';
import '../repositories/index.dart';

class CreateReminderUseCase
    implements AsyncUseCase<Reminder, CreateReminderParams> {
  final RemindersRepository repository;

  CreateReminderUseCase(this.repository);

  @override
  Future<Either<Failure, Reminder>> call(CreateReminderParams params) async {
    return await repository.createReminder(params);
  }
}

class CreateReminderParams {
  String? token;
  final String title;
  final String description;
  final String date;
  final String color;

  CreateReminderParams({
    this.token,
    required this.title,
    required this.description,
    required this.date,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'title': title,
      'description': description,
      'date': date,
      'color': color,
    };
  }

  factory CreateReminderParams.fromMap(Map<String, dynamic> map) {
    return CreateReminderParams(
      token: map['token'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      color: map['color'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateReminderParams.fromJson(String source) =>
      CreateReminderParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
