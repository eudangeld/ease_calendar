import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Reminder extends Equatable {
  final String? id;
  final String title;
  final String description;
  final DateTime date;
  final Color color;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Reminder(
      {this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.color,
      this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'color': color.value,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Reminder.fromJson(dynamic source) {
    return Reminder(
      id: source['id'],
      title: source['title'],
      description: source['description'],
      date: DateTime.parse(source['date']),
      color: Color(int.parse(source['color'].replaceAll('#', '0xff'))),
      createdAt: DateTime.parse(source['createdAt']),
      updatedAt: DateTime.parse(source['updatedAt']),
    );
  }

  static Color fromStringToColor(hex) =>
      Color(int.parse(hex.replaceAll('#', '0xff')));

  @override
  List<Object?> get props =>
      [id, title, description, date, color, createdAt, updatedAt];
}
