import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:easy_calendar/core/util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Util test group', () {
    test('When received month 1 return next month 2 same year (2022)', () {
      DateTime referenceDate = DateTime(2022, 1, 1);
      final result = nextMonth(referenceDate);

      expect(result, DateTime(2022, 2, 1));
    });
    test('When receive month 12 return next month (1) next year (2023)', () {
      DateTime referenceDate = DateTime(2022, 12, 1);
      final result = nextMonth(referenceDate);

      expect(result, DateTime(2023, 1, 1));
    });
    test('When received month 2 return prev month 1 same year (2022)', () {
      DateTime referenceDate = DateTime(2022, 2, 1);
      final result = previusMonth(referenceDate);

      expect(result, DateTime(2022, 1, 1));
    });
    test('When receive month 1 return prev month (12) prev year (2021)', () {
      DateTime referenceDate = DateTime(2022, 1, 1);
      final result = previusMonth(referenceDate);

      expect(result, DateTime(2021, 12, 1));
    });

    test('Sould fill with zeros =when needed', () {
      final DateTime dateTest = DateTime(2024, 2, 20);
      final response = fillMonthWithZeros(dateTest);

      expect(response, '02');
    });
    test('Sould not fill with zeros for month 12 ', () {
      final DateTime dateTest = DateTime(2024, 12, 20);
      final response = fillMonthWithZeros(dateTest);

      expect(response, '12');
    });

    test('should return TRUE form same day', () {
      final dateOne = DateTime(2024, 1, 1);
      final compareDate = DateTime(2024, 1, 1);

      final response = checkSameDay(dateOne, compareDate);

      expect(response, true);
    });
    test('should return FALSE form different dates', () {
      final dateOne = DateTime(2024, 1, 2);
      final compareDate = DateTime(2024, 1, 1);

      final response = checkSameDay(dateOne, compareDate);

      expect(response, false);
    });
  });
}
