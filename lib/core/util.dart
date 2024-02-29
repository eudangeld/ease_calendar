import '../domain/entities/index.dart';

List<String> get weekDaysLabel =>
    ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

List<String> get fullNameWeekDays => [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

List<String> get monthNames => [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

DateTime nextMonth(DateTime date) {
  int nextMonth = date.month + 1;
  int nextYear = date.year;

  if (nextMonth > 12) {
    nextYear++;
    nextMonth = 1;
  }

  return DateTime(nextYear, nextMonth, 1);
}

DateTime previusMonth(DateTime date) {
  int prevMonth = date.month - 1;
  int prevYear = date.year;

  if (prevMonth == 0) {
    prevYear--;
    prevMonth = 12;
  }

  return DateTime(prevYear, prevMonth, 1);
}

bool checkSameDay(DateTime date, DateTime compareDate) =>
    date.month == compareDate.month &&
    date.day == compareDate.day &&
    date.year == compareDate.year;

String fillMonthWithZeros(DateTime date) => date.month.toString().length < 2
    ? '0${date.month.toString()}'
    : date.month.toString();

String fillDayWithZeros(DateTime date) => date.day.toString().length < 2
    ? '0${date.day.toString()}'
    : date.day.toString();
String fillHourWithZeros(DateTime date) => date.hour.toString().length < 2
    ? '0${date.hour.toString()}'
    : date.hour.toString();
String fillMinutesWithZeros(DateTime date) => date.minute.toString().length < 2
    ? '0${date.minute.toString()}'
    : date.minute.toString();

String dateObjectToPresentationDate(DateTime date) {
  final weekDayName = fullNameWeekDays[date.weekday - 1];
  final monthName = monthNames[date.month - 1];

  return '$weekDayName, $monthName ${fillDayWithZeros(date)}, ${date.year}';
}

String extractStringTimeFromDate(DateTime date) =>
    '${date.hour}:${date.minute}';

String extractStringDateFromDateObject(DateTime date) =>
    '${fillMonthWithZeros(date)}/${fillDayWithZeros(date)}/${date.year}';

sorReminders(List<Reminder> reminders) => reminders.sort(
      (a, b) => a.date.compareTo(b.date),
    );
