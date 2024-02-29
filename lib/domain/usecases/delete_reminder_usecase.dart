import 'package:dartz/dartz.dart';

import '../../core/index.dart';
import '../repositories/index.dart';

class DeleteReminderUseCase implements AsyncUseCase<int, DeleteReminderParams> {
  final RemindersRepository repositorie;

  DeleteReminderUseCase(this.repositorie);

  @override
  Future<Either<Failure, int>> call(DeleteReminderParams params) async {
    return repositorie.deleteReminder(params);
  }
}

class DeleteReminderParams {
  String? token;
  String id;
  DateTime currentDate;

  DeleteReminderParams({
    this.token,
    required this.id,
    required this.currentDate,
  });
}
