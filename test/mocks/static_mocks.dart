import 'package:easy_calendar/domain/entities/reminder.dart';
import 'package:easy_calendar/domain/usecases/create_reminder_usecase.dart';
import 'package:easy_calendar/domain/usecases/delete_reminder_usecase.dart';
import 'package:easy_calendar/domain/usecases/edit_reminder_usecase.dart';
import 'package:easy_calendar/domain/usecases/retrieve_dates_reminders_usecase.dart';
import 'package:easy_calendar/domain/usecases/retrieve_reminder_by_id_usecase.dart';
import 'package:easy_calendar/domain/usecases/retrieve_reminders_day_usecase.dart';
import 'package:flutter/material.dart';

final Reminder reminderMock = Reminder(
    id: '0493ad93-1290-41ea-818e-c7a371c828df',
    title: 'Title Example',
    description: 'Description example',
    date: DateTime.parse('2022-11-03 15:14:21.005Z'),
    color: Colors.white,
    createdAt: DateTime.parse("2022-11-03T15:14:36.265Z"),
    updatedAt: DateTime.parse("2022-11-03T15:14:36.265Z"));

final List<Reminder> remindersResponseMock = [
  reminderMock,
  reminderMock,
  reminderMock
];

final CreateReminderParams createReminderParamMock = CreateReminderParams(
  token: 'token',
  title: 'reminder test title',
  description: 'reminder test description',
  date: DateTime.now().toString(),
  color: Colors.white.toString(),
);

const String tokenMock = '2ab681ba4-7556-4358-9500-e4afe1ce6141';
const String idMock = '23bab33a4-7556-4358-9500-e4afe1ce6122';

final List<DateTime> dateTimeListMock = [
  DateTime(2023, 2, 17),
  DateTime(2023, 2, 18),
  DateTime(2023, 2, 19),
  DateTime(2023, 2, 20),
  DateTime(2023, 2, 21),
  DateTime(2023, 2, 22),
];

final RetrieveReminderByDateParams remindersByDataParamsMock =
    RetrieveReminderByDateParams(date: DateTime.now(), token: tokenMock);

final RetrieveReminderByIdParams retrieveRemindersByIdParamsMock =
    RetrieveReminderByIdParams(id: idMock, token: tokenMock);

final EditReminderParams editreminderParamMock = EditReminderParams(
    id: idMock,
    color: '#ffffff',
    date: DateTime.now().toString(),
    description: 'new description',
    title: 'new title',
    token: tokenMock);

final DeleteReminderParams deleteReminderParamsMock = DeleteReminderParams(
    id: idMock, token: tokenMock, currentDate: DateTime.now());

final GetReminderDatesParams getDatesParamsMock =
    GetReminderDatesParams(date: DateTime.now(), token: tokenMock);
