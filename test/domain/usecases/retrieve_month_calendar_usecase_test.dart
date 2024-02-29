import 'package:dartz/dartz.dart';
import 'package:easy_calendar/domain/entities/calendar_day.dart';
import 'package:easy_calendar/domain/usecases/retrieve_month_calendar_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/build_runner.mocks.dart';

void main() {
  late RetrieveMonthCalendarUseCase sut;
  late MockCalendarRepository mockRepo;

  group('@RetrieveMonthCalendarUseCase retrieve month days test group ', () {
    setUp(() {
      mockRepo = MockCalendarRepository();
      sut = RetrieveMonthCalendarUseCase(mockRepo);
    });

    test('Should get a list of a days for specific month ', () {
      final List<CalendarDay> mockedResult = [CalendarDay.empty()];
      final DateTime mockdate = DateTime(2023, 2, 1);
      when(mockRepo.getCalendarMonth(mockdate)).thenReturn(Right(mockedResult));

      final response = sut(mockdate);

      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, mockedResult)));
    });
  });
}
