import 'package:dartz/dartz.dart';
import 'package:easy_calendar/domain/usecases/retrieve_reminder_by_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/build_runner.mocks.dart';
import '../../mocks/static_mocks.dart';

void main() {
  late RetrieveReminderByIdUseCase sut;
  late MockReminderRepository mockRepo;
  final RetrieveReminderByIdParams mockParams =
      RetrieveReminderByIdParams(id: 'id-mock', token: 'token-mock');

  group('@RetrieveReminderByIdUseCase reminder by id group test ', () {
    setUp(() {
      mockRepo = MockReminderRepository();
      sut = RetrieveReminderByIdUseCase(mockRepo);
    });

    test('Should return an specific reminder based on ID ', () async {
      when(mockRepo.getReminderById(mockParams))
          .thenAnswer((_) async => Right(reminderMock));

      final response = await sut(mockParams);

      response.fold(
          (_) {}, ((rightResult) => expect(rightResult, reminderMock)));
    });
  });
}
