import 'package:equatable/equatable.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();
}

class GetCalendarMonthEvent extends CalendarEvent {
  final DateTime date;

  const GetCalendarMonthEvent(this.date);

  @override
  List<Object?> get props => [date];
}

class ChangeSelectedDayEvent extends CalendarEvent {
  final DateTime newDateTime;

  const ChangeSelectedDayEvent(this.newDateTime);

  @override
  List<Object?> get props => [newDateTime];
}

class IncrementCalendarEvent extends CalendarEvent {
  final DateTime currentMonth;

  const IncrementCalendarEvent(this.currentMonth);

  @override
  List<Object?> get props => [currentMonth];
}
