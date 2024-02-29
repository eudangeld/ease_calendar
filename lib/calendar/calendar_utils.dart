import '../domain/entities/calendar_day.dart';

class CalendarUtils {
  List<CalendarDay> getMonth() {
    final seedDate = DateTime(2024, 2);
    final DateTime today = DateTime.now();

    final firstDayThisMonth =
        DateTime(seedDate.year, seedDate.month, seedDate.day);

    final firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);

    final totalDays = firstDayNextMonth.difference(firstDayThisMonth).inDays;
    var monthDays = List<int>.generate(totalDays, (i) => i + 1);
    var emptyDays = [];

    final response = List<CalendarDay>.generate(totalDays, (i) {
      final _dateTime = DateTime(seedDate.year, seedDate.month, i + 1);

      return CalendarDay(
          dateTime: _dateTime,
          hasEvents: false,
          isSelected: false,
          isToday: checkForSameDay(today, _dateTime),
          isEmpty: false);
    });

    if (firstDayThisMonth.weekday != DateTime.sunday) {
      emptyDays = List<CalendarDay>.generate(
          firstDayThisMonth.weekday, (_) => CalendarDay.empty());
    }

    return [...emptyDays, ...response];
  }

  bool checkForSameDay(DateTime dateOne, DateTime dateTwo) {
    return dateOne.day == dateTwo.day &&
        dateOne.month == dateTwo.month &&
        dateOne.year == dateTwo.year;
  }
}
