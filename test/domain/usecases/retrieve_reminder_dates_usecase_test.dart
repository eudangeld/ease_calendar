import 'package:dartz/dartz.dart';
import 'package:easy_calendar/domain/usecases/retrieve_dates_reminders_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/build_runner.mocks.dart';
import '../../mocks/static_mocks.dart';

void main() {
  late RetrieveDatesReminderUseCase sut;
  late MockReminderRepository mockRepo;
  const String mockToken = 'f1c4786f-dce0-4c8a-9169-298461bcc7b2';
  final List<DateTime> mockedResult = [
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
  ];

  group('@RetrieveReminderDatesUseCase retrieve month days test group ', () {
    setUp(() {
      mockRepo = MockReminderRepository();
      sut = RetrieveDatesReminderUseCase(mockRepo);
    });

    test('Should receive a datetime list repreenting days with rimenders',
        () async {
      when(mockRepo.getDates(getDatesParamsMock))
          .thenAnswer((_) async => Right(mockedResult));

      final response = await sut(getDatesParamsMock);

      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, mockedResult)));
    });
  });
}
