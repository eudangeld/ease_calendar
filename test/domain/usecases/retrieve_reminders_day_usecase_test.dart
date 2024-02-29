import 'package:dartz/dartz.dart';
import 'package:easy_calendar/domain/usecases/retrieve_reminders_day_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/build_runner.mocks.dart';
import '../../mocks/static_mocks.dart';

void main() {
  late RetrieveRemindersDayUseCase sut;
  late MockReminderRepository mockRepo;
  const String mockToken = 'f1c4786f-dce0-4c8a-9169-298461bcc7b2';
  late RetrieveReminderByDateParams mockParams;

  group('@RetrieveReminderDatesUseCase retrieve month days test group ', () {
    setUp(() {
      mockRepo = MockReminderRepository();
      sut = RetrieveRemindersDayUseCase(mockRepo);
      mockParams = RetrieveReminderByDateParams(
        date: DateTime.now(),
        token: mockToken,
      );
    });

    test('Should receive a datetime list repreenting days with rimenders',
        () async {
      when(mockRepo.getRemindersByDate(mockParams))
          .thenAnswer((_) async => Right(remindersResponseMock));

      final response = await sut(mockParams);

      response.fold((_) {}, ((rightResult) {
        expect(rightResult, remindersResponseMock);
        expect(rightResult[0], equals(remindersResponseMock[0]));
      }));
    });
  });
}
