import 'package:easy_calendar/domain/datasource/reminders_remote_datasource.dart';
import 'package:easy_calendar/domain/repositories/calendar_repository.dart';
import 'package:easy_calendar/domain/repositories/reminders_repository.dart';

import 'package:mockito/annotations.dart';

@GenerateMocks([], customMocks: [
  MockSpec<RemindersRepository>(as: #MockReminderRepository),
  MockSpec<CalendarRepository>(as: #MockCalendarRepository),
  MockSpec<RemindersDataSource>(as: #MockRemindersDataSource),
])
void main() {}
