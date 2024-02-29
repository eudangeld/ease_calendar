import 'package:equatable/equatable.dart';

import '../../../domain/entities/index.dart';

enum RemindersScreen { form, list, loading }

abstract class RemindersState extends Equatable {
  RemindersScreen? screen;

  RemindersState({this.screen});
  @override
  List<Object?> get props => [screen];
}

class RemindersLoadingState extends RemindersState {}

class RemindersEmptyState extends RemindersState {}

class RemindersErrorState extends RemindersState {}

class ChangeScreenState extends RemindersState {
  ChangeScreenState(this.currentDatee);
  final DateTime currentDatee;
}

class RemindersFormState extends RemindersState {
  final dynamic formData;
  RemindersFormState({required super.screen, required this.formData});
}

class EditReminderState extends RemindersState {
  final Reminder reminder;
  EditReminderState({required super.screen, required this.reminder});
}

class RemindersListState extends RemindersState {
  final List<Reminder> reminders;
  final DateTime seddDate;
  final bool shouldUpdateCalendar;

  RemindersListState({
    required this.seddDate,
    required super.screen,
    required this.reminders,
    required this.shouldUpdateCalendar,
  });
  @override
  List<Object?> get props =>
      [reminders.length, reminders, shouldUpdateCalendar, screen, seddDate];
}
