import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_calendar/core/util.dart';
import 'package:easy_calendar/data/sources/remote/reminders_remote_data_source_implementation.dart';
import 'package:easy_calendar/domain/entities/reminder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../fixture_values/file_value_reader.dart';
import '../../mocks/static_mocks.dart';

void main() {
  late RemindersRemoteDatSourceImplementation sut;
  late Dio dio;
  late DioAdapter dioAdapter;

  group('Reminders data source test group', () {
    setUp(() {
      const baseUrl = 'https://api.calendar.codelitt.dev/';
      dio = Dio(BaseOptions(baseUrl: baseUrl));
      dioAdapter =
          DioAdapter(dio: dio, matcher: const FullHttpRequestMatcher());
      sut = RemindersRemoteDatSourceImplementation(dio);
    });

    test('Should POST new reminder', () async {
      const String creatReminderPostRoute = 'reminders/';
      dioAdapter.onPost(creatReminderPostRoute, (server) {
        server.reply(
          HttpStatus.created,
          jsonDecode(fileReader('create_reminder_response.json')),
        );
      }, data: createReminderParamMock.toMap());

      final response = await sut.createReminder(createReminderParamMock);

      expect(response, reminderMock);
    });
    test('Should Get reminders list by date', () async {
      final monthFormated = fillMonthWithZeros(remindersByDataParamsMock.date);

      final formatedDate =
          '${remindersByDataParamsMock.date.year}-$monthFormated-${fillDayWithZeros(remindersByDataParamsMock.date)}';

      final String getReminderByDateMockRoute =
          'reminders/${remindersByDataParamsMock.token}/by-day?date=$formatedDate';

      dioAdapter.onGet(
        getReminderByDateMockRoute,
        (server) {
          server.reply(
            HttpStatus.ok,
            jsonDecode(fileReader('get_reminders_list_response.json')),
          );
        },
      );

      final response = await sut.getRemindersByDate(remindersByDataParamsMock);

      expect(response[0].title, "First reminder");
      expect(response[0].description, "First description example");

      expect(response[1].title, "Secound reminder");
      expect(response[1].description, "Secound description example");
    });

    test('Should return a List with DateTime', () async {
      final monthFormated = fillMonthWithZeros(remindersByDataParamsMock.date);
      final formatedDate = '${getDatesParamsMock.date.year}-$monthFormated';

      final String getDatesRoute = 'reminders/$tokenMock?date=$formatedDate';
      dioAdapter.onGet(
        getDatesRoute,
        (server) {
          server.reply(
            HttpStatus.ok,
            jsonDecode(fileReader('get_reminders_day_response.json')),
          );
        },
      );

      final response = await sut.getDates(getDatesParamsMock);

      expect(response[0], DateTime.parse('2022-12-02T00:00:00.000Z'));
      expect(response[1], DateTime.parse('2022-11-03T00:00:00.000Z'));
    });

    test('Should edit reminder', () async {
      final String editRouteMock =
          "reminders/${editreminderParamMock.token}/${editreminderParamMock.id}";
      dioAdapter.onPatch(editRouteMock, (server) {
        server.reply(
          HttpStatus.ok,
          jsonDecode(fileReader('edit_reminder_response.json')),
        );
      }, data: editreminderParamMock.toMap());
      final response = await sut.editReminder(editreminderParamMock);

      expect(response.title, editreminderParamMock.title);
      expect(response.description, editreminderParamMock.description);
      expect(response, isA<Reminder>());
    });

    test('Should delete reminder', () async {
      final String deleteRouteMock =
          "reminders/${deleteReminderParamsMock.token}/${deleteReminderParamsMock.id}";

      dioAdapter.onDelete(deleteRouteMock, (server) {
        server.reply(
          HttpStatus.ok,
          jsonDecode(fileReader('edit_reminder_response.json')),
        );
      });
      final response = await sut.deleteReminder(deleteReminderParamsMock);

      expect(response, HttpStatus.ok);
    });
    test('Should retrieve reminder by ID', () async {
      final String retrieveSpecificReminderByIdRouteMock =
          "reminders/${retrieveRemindersByIdParamsMock.token}/${retrieveRemindersByIdParamsMock.id}";

      dioAdapter.onGet(retrieveSpecificReminderByIdRouteMock, (server) {
        server.reply(
          HttpStatus.ok,
          jsonDecode(fileReader('get_single_reminder_response.json')),
        );
      });
      final response =
          await sut.getReminderById(retrieveRemindersByIdParamsMock);

      expect(response.id, '417b9cb6-6953-4cb5-b42e-6b6c8b209fe5');
      expect(response.title, 'Title Example');
      expect(response.description, 'Description example');
    });
  });
}
