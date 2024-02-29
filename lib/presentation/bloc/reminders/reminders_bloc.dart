import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util.dart';
import '../../../domain/entities/token.dart';
import '../../../domain/usecases/index.dart';
import '../index.dart';

class RemindersBloc extends Bloc<RemindersEvent, RemindersState> {
  final CreateReminderUseCase createReminderUseCase;
  final RetrieveRemindersDayUseCase retrieveFullRemindersDayUseCase;
  final EditReminderUseCase editReminderUseCase;
  final DeleteReminderUseCase deleteReminderUseCase;
  final RetrieveTokenUseCase retrieveTokenUseCase;

  RemindersBloc({
    required this.createReminderUseCase,
    required this.retrieveFullRemindersDayUseCase,
    required this.editReminderUseCase,
    required this.deleteReminderUseCase,
    required this.retrieveTokenUseCase,
  }) : super(RemindersEmptyState()) {
    on<OpenRemindersListEvent>((event, emit) async {
      emit(RemindersLoadingState()..screen = RemindersScreen.loading);
      final token = await _retrieveOrCreateNewToken();

      final fullDayRemindersList = await retrieveFullRemindersDayUseCase(
          RetrieveReminderByDateParams(date: event.listDateTime, token: token));

      fullDayRemindersList.fold(
        (_) => {},
        (remindersListResult) {
          sorReminders(remindersListResult);

          emit(RemindersListState(
              screen: RemindersScreen.list,
              shouldUpdateCalendar: false,
              reminders: remindersListResult,
              seddDate: event.listDateTime));
        },
      );
    });
    on<OpenReminderFormEvent>((event, emit) async {
      emit(RemindersFormState(screen: RemindersScreen.form, formData: {}));
    });
    on<OpenEditReminderScreenEvent>((event, emit) async {
      emit(EditReminderState(
        reminder: event.reminder,
        screen: RemindersScreen.form,
      ));
    });
    on<CreateReminderEvent>((event, emit) async {
      emit(RemindersLoadingState()..screen = RemindersScreen.loading);
      final token = await _retrieveOrCreateNewToken();
      event.formData.token = token;
      await createReminderUseCase(event.formData);

      final fullDayRemindersList = await retrieveFullRemindersDayUseCase(
          RetrieveReminderByDateParams(date: event.currentDate, token: token));

      fullDayRemindersList.fold(
        (_) => {},
        (remindersListResult) {
          sorReminders(remindersListResult);
          emit(RemindersListState(
              screen: RemindersScreen.list,
              shouldUpdateCalendar: true,
              reminders: remindersListResult,
              seddDate: event.currentDate));
        },
      );
    });
    on<EditReminderEvent>((event, emit) async {
      emit(RemindersLoadingState()..screen = RemindersScreen.loading);
      final token = await _retrieveOrCreateNewToken();
      event.editedReminderParam.token = token;
      await editReminderUseCase(event.editedReminderParam);

      final fullDayRemindersList = await retrieveFullRemindersDayUseCase(
          RetrieveReminderByDateParams(
              date: DateTime.parse(event.editedReminderParam.date),
              token: token));

      fullDayRemindersList.fold(
        (_) => {},
        (remindersListResult) {
          sorReminders(remindersListResult);
          emit(RemindersListState(
              screen: RemindersScreen.list,
              shouldUpdateCalendar: true,
              reminders: remindersListResult,
              seddDate: DateTime.parse(event.editedReminderParam.date)));
        },
      );
    });
    on<CancelReminderEditEvent>((event, emit) async {
      final cancelState = RemindersEmptyState()..screen = RemindersScreen.list;
      emit(cancelState);
    });
    on<DeleteReminderEvent>((event, emit) async {
      emit(RemindersLoadingState()..screen = RemindersScreen.loading);
      final token = await _retrieveOrCreateNewToken();

      event.params.token = token;

      await deleteReminderUseCase(event.params);
      final fullDayRemindersList = await retrieveFullRemindersDayUseCase(
          RetrieveReminderByDateParams(
              date: event.params.currentDate, token: token));

      fullDayRemindersList.fold(
        (_) => {},
        (remindersListResult) {
          sorReminders(remindersListResult);
          emit(RemindersListState(
              screen: RemindersScreen.list,
              shouldUpdateCalendar: true,
              reminders: remindersListResult,
              seddDate: event.params.currentDate));
        },
      );
    });
  }

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
