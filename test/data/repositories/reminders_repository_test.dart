import 'dart:io';

import 'package:easy_calendar/core/error/exceptions.dart';
import 'package:easy_calendar/core/error/failures.dart';
import 'package:easy_calendar/data/repositories/reminders_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/build_runner.mocks.dart';
import '../../mocks/static_mocks.dart';

void main() {
  late RemindersRepositoryImplementation sut;
  late MockRemindersDataSource dataSourceMock;

  setUp(() {
    dataSourceMock = MockRemindersDataSource();
    sut = RemindersRepositoryImplementation(dataSourceMock);
  });

  group('Create reminders tests group', () {
    test('Should return statuscode.created after reminder creation', () async {
      when(dataSourceMock.createReminder(createReminderParamMock))
          .thenAnswer((_) async => reminderMock);
      final response = await sut.createReminder(createReminderParamMock);

      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, reminderMock)));
    });
    test('Should handle exception and return a Failure', () async {
      when(dataSourceMock.createReminder(createReminderParamMock)).thenAnswer(
          (_) async => throw ServerException('Error creating reminder'));
      final response = await sut.createReminder(createReminderParamMock);

      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, isA<ServerFailure>())));
    });
  });
  group('Get days list test group', () {
    test('Should a dataTime list representing days with reminders', () async {
      when(dataSourceMock.getDates(getDatesParamsMock))
          .thenAnswer((_) async => dateTimeListMock);

      final response = await sut.getDates(getDatesParamsMock);
      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, dateTimeListMock)));
    });
    test('Should handle exception and return a Failure', () async {
      when(dataSourceMock.getDates(getDatesParamsMock)).thenAnswer(
          (_) async => throw ServerException('Error retrieving dates'));

      final response = await sut.getDates(getDatesParamsMock);
      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, isA<ServerFailure>())));
    });
  });
  group('Get reminder by day test group', () {
    test('Should return List of reminders from a specifc day', () async {
      when(dataSourceMock.getRemindersByDate(remindersByDataParamsMock))
          .thenAnswer((_) async => remindersResponseMock);

      final response = await sut.getRemindersByDate(remindersByDataParamsMock);
      response.fold((_) {},
          ((rightResult) => expect(rightResult, remindersResponseMock)));
    });
    test('Should handle exception and return a Failure', () async {
      when(dataSourceMock.getRemindersByDate(remindersByDataParamsMock))
          .thenAnswer((_) async =>
              throw ServerException('Error retrieving reminders day'));

      final response = await sut.getRemindersByDate(remindersByDataParamsMock);
      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, isA<ServerFailure>())));
    });
  });
  group('Get reminder by ID test group', () {
    test('Should return an specifc Reminder based on ID', () async {
      when(dataSourceMock.getReminderById(retrieveRemindersByIdParamsMock))
          .thenAnswer((_) async => reminderMock);

      final response =
          await sut.getReminderById(retrieveRemindersByIdParamsMock);
      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, reminderMock)));
    });
    test('Should handle exception and return a Failure', () async {
      when(dataSourceMock.getReminderById(retrieveRemindersByIdParamsMock))
          .thenAnswer(
              (_) async => throw ServerException('Error retiving reminder'));

      final response =
          await sut.getReminderById(retrieveRemindersByIdParamsMock);
      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, isA<ServerFailure>())));
    });
  });
  group('Edit reminder test group', () {
    test('Should return edited reminder', () async {
      when(dataSourceMock.editReminder(editreminderParamMock))
          .thenAnswer((_) async => reminderMock);

      final response = await sut.editReminder(editreminderParamMock);
      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, reminderMock)));
    });
    test('Should handle exception and return a Failure', () async {
      when(dataSourceMock.editReminder(editreminderParamMock)).thenAnswer(
          (_) async => throw ServerException('Error editing reminder'));

      final response = await sut.editReminder(editreminderParamMock);
      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, isA<ServerFailure>())));
    });
  });
  group('Delete reminder test group', () {
    test('Should delete specific reminder and return ok - 200', () async {
      when(dataSourceMock.deleteReminder(deleteReminderParamsMock))
          .thenAnswer((_) async => HttpStatus.ok);

      final response = await sut.deleteReminder(deleteReminderParamsMock);
      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, HttpStatus.ok)));
    });
    test('Should handle exception and return a Failure', () async {
      when(dataSourceMock.deleteReminder(deleteReminderParamsMock)).thenAnswer(
          (_) async =>
              throw ServerException('Error retrieving deleting reminder'));

      final response = await sut.deleteReminder(deleteReminderParamsMock);
      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, isA<ServerFailure>())));
    });
  });
}
