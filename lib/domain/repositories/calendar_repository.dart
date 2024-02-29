import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/calendar_day.dart';

abstract class CalendarRepository {
  // just return the specified month without any reminder
  Either<Failure, List<CalendarDay>> getCalendarMonth(DateTime date);
}
