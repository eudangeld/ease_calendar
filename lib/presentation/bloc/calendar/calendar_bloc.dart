import 'dart:html';

import 'package:easy_calendar/core/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/calendar_day.dart';
import '../../../domain/entities/token.dart';
import '../../../domain/usecases/retrieve_dates_reminders_usecase.dart';
import '../../../domain/usecases/retrieve_month_calendar_usecase.dart';
import '../../../domain/usecases/retrieve_token_usecase.dart';
import 'calendar_events.dart';
import 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarFullState> {
  final RetrieveMonthCalendarUseCase getCalendarMonth;
  final RetrieveDatesReminderUseCase retrieveDatesReminderUseCase;
  final RetrieveTokenUseCase retrieveTokenUseCase;

  CalendarBloc({
    required this.getCalendarMonth,
    required this.retrieveDatesReminderUseCase,
    required this.retrieveTokenUseCase,
  }) : super(CalendarFullState.empty()) {
    on<ChangeSelectedDayEvent>((event, emit) {
      emit(CalendarFullState.changeDayTime(event.newDateTime));
    });

    on<GetCalendarMonthEvent>((event, emit) async {
      emit(CalendarFullState.loading());
      final token = await _retrieveOrCreateNewToken();

      final GetReminderDatesParams getReminderDatesParam =
          GetReminderDatesParams(date: event.date, token: token);

      final monthCalendar = getCalendarMonth(event.date);
      final datesWitRemindersEither =
          await retrieveDatesReminderUseCase(getReminderDatesParam);

      List<DateTime> datesWithReminders = [];
      List<CalendarDay> filledMonth = [];

      datesWitRemindersEither.fold((l) {}, (result) {
        datesWithReminders = result;
      });

      monthCalendar.fold(
        (leftResult) => emit(CalendarFullState.empty()),
        ((List<CalendarDay> result) {
          filledMonth = result;
        }),
      );

      filledMonth = filledMonth.map((day) {
        datesWithReminders.forEach((element) {
          if (checkSameDay(day.dateTime, element)) {
            day.hasEvents = true;
          }
        });
        return day;
      }).toList();

      emit(CalendarFullState.filled(filledMonth, event.date));
    });
  }

  // refact to avoid DRY :(
  Future<String> _retrieveOrCreateNewToken() async {
    final Storage localStorage = window.localStorage;
    if (localStorage['token'] != null) {
      return localStorage['token']!;
    }

    final token = await _retrieveToken();
    return token.id;
  }

  Future<Token> _retrieveToken() async {
    final Storage localStorage = window.localStorage;

    final tokenReponse = await retrieveTokenUseCase(RetrieveTokenParams(
        name: 'dannylo - ${DateTime.now().toIso8601String()}'));

    return tokenReponse.fold((_) => Token.empty(), (token) {
      localStorage['token'] = token.id;
      return token;
    });
  }
}
