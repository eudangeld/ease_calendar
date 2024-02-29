import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/util.dart';
import '../../domain/entities/index.dart';
import '../../domain/repositories/index.dart';

class CalendarRepositoryImplementation implements CalendarRepository {
  @override
  Either<Failure, List<CalendarDay>> getCalendarMonth(DateTime date) {
    try {
      final seedDate = date;
      final DateTime today = DateTime.now();

      final firstDayThisMonth = DateTime(seedDate.year, seedDate.month, 1);

      final firstDayNextMonth = nextMonth(seedDate);

      final totalDays = firstDayNextMonth.difference(firstDayThisMonth).inDays;

      var emptyDays = [];

      final response = List<CalendarDay>.generate(totalDays, (i) {
        final dateTime = DateTime(seedDate.year, seedDate.month, i + 1);

        return CalendarDay(
            dateTime: dateTime,
            hasEvents: false,
            isSelected: false,
            isToday: _checkForSameDay(today, dateTime),
            isEmpty: false);
      });

      if (firstDayThisMonth.weekday != DateTime.sunday) {
        emptyDays = List<CalendarDay>.generate(
            firstDayThisMonth.weekday, (_) => CalendarDay.empty());
      }

      return Right([...emptyDays, ...response]);
    } catch (_) {
      return Left(FillSimpleCalendarFailure());
    }
  }

  bool _checkForSameDay(DateTime dateOne, DateTime dateTwo) {
    return dateOne.day == dateTwo.day &&
        dateOne.month == dateTwo.month &&
        dateOne.year == dateTwo.year;
  }
}
