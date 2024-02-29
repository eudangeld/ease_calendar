import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:easy_calendar/domain/usecases/create_reminder_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/build_runner.mocks.dart';
import '../../mocks/static_mocks.dart';

void main() {
  late CreateReminderUseCase sut;
  late MockReminderRepository mockRepo;
  late CreateReminderParams mockParams;

  group('@CreateReminderUseCase create reminder useacase group ', () {
    setUp(() {
      mockRepo = MockReminderRepository();
      sut = CreateReminderUseCase(mockRepo);
      mockParams = CreateReminderParams(
          token: 'token',
          color: Colors.amberAccent.toString(),
          date: DateTime.now().toString(),
          description: 'description',
          title: 'title');
    });

    test('Should create and return the new reminder', () async {
      when(mockRepo.createReminder(mockParams))
          .thenAnswer((_) async => Right(reminderMock));

      final response = await sut(mockParams);

      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, equals(reminderMock))));
    });
  });
}
