import 'package:dartz/dartz.dart';
import 'package:easy_calendar/domain/usecases/edit_reminder_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/build_runner.mocks.dart';
import '../../mocks/static_mocks.dart';

void main() {
  late EditReminderUseCase sut;
  late MockReminderRepository mockRepo;
  final EditReminderParams mockParams = EditReminderParams(
      id: idMock,
      token: 'token',
      color: Colors.red.toString(),
      date: DateTime.now().toString(),
      description: 'description',
      title: 'title');

  group('@EditReminderUseCase reminder by id group test ', () {
    setUp(() {
      mockRepo = MockReminderRepository();
      sut = EditReminderUseCase(mockRepo);
    });

    test('Should edit and return the edited reminder', () async {
      when(mockRepo.editReminder(mockParams))
          .thenAnswer((_) async => Right(reminderMock));

      final response = await sut(mockParams);

      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, reminderMock)));
    });
  });
}
