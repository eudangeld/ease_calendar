import 'package:equatable/equatable.dart';

import '../../../domain/entities/reminder.dart';
import '../../../domain/usecases/index.dart';

abstract class RemindersEvent extends Equatable {
  const RemindersEvent();
}

class DeleteReminderEvent extends RemindersEvent {
  final DeleteReminderParams params;

  const DeleteReminderEvent(this.params);

  @override
  List<Object?> get props => [params];
}

class OpenRemindersListEvent extends RemindersEvent {
  final DateTime listDateTime;

  const OpenRemindersListEvent(this.listDateTime);
  @override
  List<Object?> get props => [listDateTime];
}

class OpenReminderFormEvent extends RemindersEvent {
  @override
  List<Object?> get props => [];
}

class OpenEditReminderScreenEvent extends RemindersEvent {
  final Reminder reminder;
  const OpenEditReminderScreenEvent({required this.reminder});

  @override
  List<Object?> get props => [];
}

class CancelReminderEditEvent extends RemindersEvent {
  @override
  List<Object?> get props => [];
}

class CreateReminderEvent extends RemindersEvent {
  final CreateReminderParams formData;
  final DateTime currentDate;

  const CreateReminderEvent(
      {required this.formData, required this.currentDate});

  @override
  List<Object?> get props => [];
}

class EditReminderEvent extends RemindersEvent {
  final EditReminderParams editedReminderParam;

  const EditReminderEvent(this.editedReminderParam);

  @override
  List<Object?> get props => [editedReminderParam];
}
