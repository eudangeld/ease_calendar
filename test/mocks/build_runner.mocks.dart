// Mocks generated by Mockito 5.4.0 from annotations
// in easy_calendar/test/mocks/build_runner.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i2;
import 'package:easy_calendar/core/error/failures.dart' as _i6;
import 'package:easy_calendar/domain/datasource/reminders_remote_datasource.dart'
    as _i15;
import 'package:easy_calendar/domain/entities/calendar_day.dart' as _i14;
import 'package:easy_calendar/domain/entities/reminder.dart' as _i3;
import 'package:easy_calendar/domain/repositories/calendar_repository.dart'
    as _i13;
import 'package:easy_calendar/domain/repositories/reminders_repository.dart'
    as _i4;
import 'package:easy_calendar/domain/usecases/create_reminder_usecase.dart'
    as _i10;
import 'package:easy_calendar/domain/usecases/delete_reminder_usecase.dart'
    as _i12;
import 'package:easy_calendar/domain/usecases/edit_reminder_usecase.dart'
    as _i11;
import 'package:easy_calendar/domain/usecases/retrieve_dates_reminders_usecase.dart'
    as _i7;
import 'package:easy_calendar/domain/usecases/retrieve_reminder_by_id_usecase.dart'
    as _i9;
import 'package:easy_calendar/domain/usecases/retrieve_reminders_day_usecase.dart'
    as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeReminder_1 extends _i1.SmartFake implements _i3.Reminder {
  _FakeReminder_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RemindersRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockReminderRepository extends _i1.Mock
    implements _i4.RemindersRepository {
  MockReminderRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<DateTime>>> getDates(
          _i7.GetReminderDatesParams? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDates,
          [token],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, List<DateTime>>>.value(
            _FakeEither_0<_i6.Failure, List<DateTime>>(
          this,
          Invocation.method(
            #getDates,
            [token],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<DateTime>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i3.Reminder>>> getRemindersByDate(
          _i8.RetrieveReminderByDateParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRemindersByDate,
          [params],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, List<_i3.Reminder>>>.value(
                _FakeEither_0<_i6.Failure, List<_i3.Reminder>>(
          this,
          Invocation.method(
            #getRemindersByDate,
            [params],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i3.Reminder>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, _i3.Reminder>> getReminderById(
          _i9.RetrieveReminderByIdParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getReminderById,
          [params],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i3.Reminder>>.value(
            _FakeEither_0<_i6.Failure, _i3.Reminder>(
          this,
          Invocation.method(
            #getReminderById,
            [params],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i3.Reminder>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, _i3.Reminder>> createReminder(
          _i10.CreateReminderParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #createReminder,
          [params],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i3.Reminder>>.value(
            _FakeEither_0<_i6.Failure, _i3.Reminder>(
          this,
          Invocation.method(
            #createReminder,
            [params],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i3.Reminder>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, _i3.Reminder>> editReminder(
          _i11.EditReminderParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #editReminder,
          [params],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i3.Reminder>>.value(
            _FakeEither_0<_i6.Failure, _i3.Reminder>(
          this,
          Invocation.method(
            #editReminder,
            [params],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i3.Reminder>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, int>> deleteReminder(
          _i12.DeleteReminderParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteReminder,
          [params],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, int>>.value(
            _FakeEither_0<_i6.Failure, int>(
          this,
          Invocation.method(
            #deleteReminder,
            [params],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, int>>);
}

/// A class which mocks [CalendarRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCalendarRepository extends _i1.Mock
    implements _i13.CalendarRepository {
  MockCalendarRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Either<_i6.Failure, List<_i14.CalendarDay>> getCalendarMonth(
          DateTime? date) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCalendarMonth,
          [date],
        ),
        returnValue: _FakeEither_0<_i6.Failure, List<_i14.CalendarDay>>(
          this,
          Invocation.method(
            #getCalendarMonth,
            [date],
          ),
        ),
      ) as _i2.Either<_i6.Failure, List<_i14.CalendarDay>>);
}

/// A class which mocks [RemindersDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemindersDataSource extends _i1.Mock
    implements _i15.RemindersDataSource {
  MockRemindersDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<DateTime>> getDates(_i7.GetReminderDatesParams? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDates,
          [token],
        ),
        returnValue: _i5.Future<List<DateTime>>.value(<DateTime>[]),
      ) as _i5.Future<List<DateTime>>);
  @override
  _i5.Future<List<_i3.Reminder>> getRemindersByDate(
          _i8.RetrieveReminderByDateParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRemindersByDate,
          [params],
        ),
        returnValue: _i5.Future<List<_i3.Reminder>>.value(<_i3.Reminder>[]),
      ) as _i5.Future<List<_i3.Reminder>>);
  @override
  _i5.Future<_i3.Reminder> getReminderById(
          _i9.RetrieveReminderByIdParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getReminderById,
          [params],
        ),
        returnValue: _i5.Future<_i3.Reminder>.value(_FakeReminder_1(
          this,
          Invocation.method(
            #getReminderById,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Reminder>);
  @override
  _i5.Future<_i3.Reminder> createReminder(_i10.CreateReminderParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #createReminder,
          [params],
        ),
        returnValue: _i5.Future<_i3.Reminder>.value(_FakeReminder_1(
          this,
          Invocation.method(
            #createReminder,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Reminder>);
  @override
  _i5.Future<_i3.Reminder> editReminder(_i11.EditReminderParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #editReminder,
          [params],
        ),
        returnValue: _i5.Future<_i3.Reminder>.value(_FakeReminder_1(
          this,
          Invocation.method(
            #editReminder,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Reminder>);
  @override
  _i5.Future<int> deleteReminder(_i12.DeleteReminderParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteReminder,
          [params],
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);
}