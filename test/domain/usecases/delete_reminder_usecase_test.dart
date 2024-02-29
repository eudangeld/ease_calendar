import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:easy_calendar/domain/usecases/delete_reminder_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/build_runner.mocks.dart';

void main() {
  late DeleteReminderUseCase sut;
  late MockReminderRepository mockRepo;
  final DeleteReminderParams mockParams = DeleteReminderParams(
      token: 'token', id: 'id', currentDate: DateTime.now());

  group('@EditReminderUseCase reminder by id group test ', () {
    setUp(() {
      mockRepo = MockReminderRepository();
      sut = DeleteReminderUseCase(mockRepo);
    });

    test('Should edit and return the edited reminder', () async {
      when(mockRepo.deleteReminder(mockParams))
          .thenAnswer((_) async => const Right(HttpStatus.ok));

      final response = await sut(mockParams);

      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, HttpStatus.ok)));
    });
  });
}
