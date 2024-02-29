import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecase_interface.dart';
import '../repositories/reminders_repository.dart';

class RetrieveDatesReminderUseCase
    implements AsyncUseCase<List<DateTime>, GetReminderDatesParams> {
  RetrieveDatesReminderUseCase(this.repository);

  final RemindersRepository repository;

  @override
  Future<Either<Failure, List<DateTime>>> call(
      GetReminderDatesParams params) async {
    return await repository.getDates(params);
  }
}

class GetReminderDatesParams {
  String token;
  DateTime date;
  GetReminderDatesParams({
    required this.token,
    required this.date,
  });
}
