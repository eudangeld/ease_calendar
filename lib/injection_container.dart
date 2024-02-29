import 'package:dio/dio.dart';
import 'package:easy_calendar/data/repositories/calendar_repository_implementation.dart';
import 'package:easy_calendar/data/repositories/reminders_repository_implementation.dart';
import 'package:easy_calendar/data/sources/remote/reminders_remote_data_source_implementation.dart';
import 'package:easy_calendar/domain/datasource/reminders_remote_datasource.dart';
import 'package:easy_calendar/domain/repositories/reminders_repository.dart';
import 'package:easy_calendar/domain/usecases/create_reminder_usecase.dart';
import 'package:easy_calendar/domain/usecases/delete_reminder_usecase.dart';
import 'package:easy_calendar/domain/usecases/edit_reminder_usecase.dart';
import 'package:easy_calendar/domain/usecases/retrieve_reminders_day_usecase.dart';
import 'package:easy_calendar/domain/usecases/retrieve_token_usecase.dart';
import 'package:easy_calendar/presentation/bloc/reminders/reminders_bloc.dart';
import 'package:get_it/get_it.dart';

import 'domain/repositories/calendar_repository.dart';
import 'domain/usecases/retrieve_dates_reminders_usecase.dart';
import 'domain/usecases/retrieve_month_calendar_usecase.dart';
import 'presentation/bloc/calendar/calendar_bloc.dart';

final serviceLocator = GetIt.instance;

void intDependencies() {
  injectDependenciesBloc();
}

void injectDependenciesBloc() {
  final Dio dio = Dio();

  serviceLocator.registerLazySingleton<RemindersDataSource>(
      () => RemindersRemoteDatSourceImplementation(dio));

  serviceLocator.registerLazySingleton<RemindersRepository>(
      () => RemindersRepositoryImplementation(serviceLocator()));

  serviceLocator.registerLazySingleton<CreateReminderUseCase>(
      () => CreateReminderUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<RetrieveRemindersDayUseCase>(
      () => RetrieveRemindersDayUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<RetrieveDatesReminderUseCase>(
      () => RetrieveDatesReminderUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<EditReminderUseCase>(
      () => EditReminderUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<DeleteReminderUseCase>(
      () => DeleteReminderUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<RetrieveTokenUseCase>(
      () => RetrieveTokenUseCase(serviceLocator()));

  serviceLocator.registerLazySingleton(() => RemindersBloc(
        createReminderUseCase: serviceLocator(),
        retrieveFullRemindersDayUseCase: serviceLocator(),
        editReminderUseCase: serviceLocator(),
        deleteReminderUseCase: serviceLocator(),
        retrieveTokenUseCase: serviceLocator(),
      ));

  serviceLocator.registerLazySingleton<CalendarRepository>(
      () => CalendarRepositoryImplementation());
  serviceLocator.registerLazySingleton<RetrieveMonthCalendarUseCase>(
      () => RetrieveMonthCalendarUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<CalendarBloc>(() => CalendarBloc(
        getCalendarMonth: serviceLocator(),
        retrieveDatesReminderUseCase: serviceLocator(),
        retrieveTokenUseCase: serviceLocator(),
      ));
}
