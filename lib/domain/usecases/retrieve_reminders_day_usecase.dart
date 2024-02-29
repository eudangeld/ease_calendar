import 'package:dartz/dartz.dart';
import 'package:easy_calendar/domain/entities/reminder.dart';

import '../../core/error/failures.dart';
import '../../core/usecase_interface.dart';
import '../repositories/reminders_repository.dart';

class RetrieveRemindersDayUseCase
    implements AsyncUseCase<List<Reminder>, RetrieveReminderByDateParams> {
  final RemindersRepository repository;

  RetrieveRemindersDayUseCase(this.repository);

  @override
  Future<Either<Failure, List<Reminder>>> call(
      RetrieveReminderByDateParams params) async {
    return await repository.getRemindersByDate(params);
  }
}

class RetrieveReminderByDateParams {
  String token;
  DateTime date;
  RetrieveReminderByDateParams({
    required this.token,
    required this.date,
  });
}
