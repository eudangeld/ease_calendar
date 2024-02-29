import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecase_interface.dart';
import '../entities/calendar_day.dart';
import '../repositories/calendar_repository.dart';

class RetrieveMonthCalendarUseCase
    implements UseCase<List<CalendarDay>, DateTime> {
  RetrieveMonthCalendarUseCase(this.repository);

  final CalendarRepository repository;

  @override
  Either<Failure, List<CalendarDay>> call(DateTime date) {
    return repository.getCalendarMonth(date);
  }
}
