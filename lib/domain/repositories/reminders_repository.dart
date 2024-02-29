import 'package:dartz/dartz.dart';
import 'package:easy_calendar/domain/entities/reminder.dart';
import 'package:easy_calendar/domain/usecases/create_reminder_usecase.dart';
import 'package:easy_calendar/domain/usecases/delete_reminder_usecase.dart';
import 'package:easy_calendar/domain/usecases/retrieve_reminders_day_usecase.dart';

import '../../core/error/failures.dart';
import '../entities/token.dart';
import '../usecases/edit_reminder_usecase.dart';
import '../usecases/retrieve_dates_reminders_usecase.dart';
import '../usecases/retrieve_reminder_by_id_usecase.dart';
import '../usecases/retrieve_token_usecase.dart';

abstract class RemindersRepository {
  // retrieve only dates
  Future<Either<Failure, List<DateTime>>> getDates(
      GetReminderDatesParams token);

  //retrieve all full reminder for specific date
  Future<Either<Failure, List<Reminder>>> getRemindersByDate(
      RetrieveReminderByDateParams params);

  // retrieve reminder based on reminder ID and token
  Future<Either<Failure, Reminder>> getReminderById(
      RetrieveReminderByIdParams params);

  Future<Either<Failure, Reminder>> createReminder(CreateReminderParams params);

  Future<Either<Failure, Reminder>> editReminder(EditReminderParams params);

  Future<Either<Failure, int>> deleteReminder(DeleteReminderParams params);

  Future<Either<Failure, Token>> retrieveToken(RetrieveTokenParams params);
}
