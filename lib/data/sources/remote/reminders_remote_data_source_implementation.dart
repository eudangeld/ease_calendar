import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/util.dart';
import '../../../domain/datasource/reminders_remote_datasource.dart';
import '../../../domain/entities/index.dart';
import '../../../domain/usecases/index.dart';

class RemindersRemoteDatSourceImplementation implements RemindersDataSource {
  final Dio httpClient;
  final baseUrl = 'https://api.calendar.codelitt.dev/';

  RemindersRemoteDatSourceImplementation(this.httpClient) {
    httpClient.options = BaseOptions(baseUrl: baseUrl);
  }

  @override
  Future<Reminder> createReminder(CreateReminderParams params) async {
    try {
      final response = await httpClient.post(
        'reminders/',
        data: params.toMap(),
      );

      return Reminder.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<Reminder>> getRemindersByDate(
      RetrieveReminderByDateParams params) async {
    try {
      final monthFormated = fillMonthWithZeros(params.date);
      final formatedDate =
          '${params.date.year}-$monthFormated-${fillDayWithZeros(params.date)}';

      final response = await httpClient
          .get('reminders/${params.token}/by-day?date=$formatedDate');

      final List<dynamic> responseList = response.data as List<dynamic>;

      return responseList
          .map((reminder) => Reminder.fromJson(reminder))
          .toList();
    } on DioError {
      throw ServerException('Server error');
    }
  }

  @override
  Future<List<DateTime>> getDates(GetReminderDatesParams params) async {
    try {
      final formatedDate =
          '${params.date.year}-${fillMonthWithZeros(params.date)}';

      final response =
          await httpClient.get('reminders/${params.token}?date=$formatedDate');

      final List<dynamic> responseList = response.data as List<dynamic>;

      return responseList.map((date) => DateTime.parse(date['date'])).toList();
    } on DioError {
      throw ServerException('Server error');
    }
  }

  @override
  Future<Reminder> editReminder(EditReminderParams params) async {
    try {
      await httpClient.patch('reminders/${params.token}/${params.id}',
          data: params.toMap());

      return Reminder(
          id: params.id,
          title: params.title,
          description: params.description,
          date: DateTime.parse(params.date),
          color: Color(int.parse(params.color.replaceAll('#', '0xff'))),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
    } on DioError {
      throw ServerException('Server error');
    }
  }

  @override
  Future<int> deleteReminder(DeleteReminderParams params) async {
    try {
      await httpClient.delete(
        "reminders/${params.token}/${params.id}",
      );
      return HttpStatus.ok;
    } on DioError {
      throw ServerException('Server error');
    }
  }

  @override
  Future<Reminder> getReminderById(RetrieveReminderByIdParams params) async {
    try {
      final response =
          await httpClient.get("reminders/${params.token}/${params.id}");
      return Reminder.fromJson(response.data);
    } on DioError {
      throw ServerException('Server error');
    }
  }

  @override
  Future<Token> retrieveToken(RetrieveTokenParams params) async {
    try {
      final response = await httpClient.post("tokens", data: params.toMap());
      return Token.fromMap(response.data);
    } on DioError {
      throw ServerException('Server error');
    }
  }
}
