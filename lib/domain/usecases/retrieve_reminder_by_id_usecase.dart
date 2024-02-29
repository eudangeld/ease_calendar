import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecase_interface.dart';

import '../entities/reminder.dart';
import '../repositories/reminders_repository.dart';

class RetrieveReminderByIdUseCase
    implements AsyncUseCase<Reminder, RetrieveReminderByIdParams> {
  final RemindersRepository repositorie;

  RetrieveReminderByIdUseCase(this.repositorie);

  @override
  Future<Either<Failure, Reminder>> call(
      RetrieveReminderByIdParams params) async {
    return await repositorie.getReminderById(params);
  }
}

class RetrieveReminderByIdParams {
  String token;
  String id;
  RetrieveReminderByIdParams({
    required this.token,
    required this.id,
  });
}
