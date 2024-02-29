import 'dart:async';

import 'package:easy_calendar/domain/entities/token.dart';
import 'package:easy_calendar/domain/usecases/retrieve_token_usecase.dart';

import '../entities/reminder.dart';
import '../usecases/create_reminder_usecase.dart';
import '../usecases/delete_reminder_usecase.dart';
import '../usecases/edit_reminder_usecase.dart';
import '../usecases/retrieve_dates_reminders_usecase.dart';
import '../usecases/retrieve_reminder_by_id_usecase.dart';
import '../usecases/retrieve_reminders_day_usecase.dart';

abstract class RemindersDataSource {
  Future<List<DateTime>> getDates(GetReminderDatesParams token);

  Future<List<Reminder>> getRemindersByDate(
      RetrieveReminderByDateParams params);

  Future<Reminder> getReminderById(RetrieveReminderByIdParams params);

  Future<Reminder> createReminder(CreateReminderParams params);

  Future<Reminder> editReminder(EditReminderParams params);

  Future<int> deleteReminder(DeleteReminderParams params);

  Future<Token> retrieveToken(RetrieveTokenParams params);
}
