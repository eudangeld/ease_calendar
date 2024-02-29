import 'package:equatable/equatable.dart';

class CalendarDay extends Equatable {
  CalendarDay({
    required this.dateTime,
    required this.isSelected,
    required this.isToday,
    required this.isEmpty,
    required this.hasEvents,
  });

  final DateTime dateTime;
  bool isSelected;
  final bool isToday;
  final bool isEmpty;
  bool hasEvents;

  factory CalendarDay.empty() => CalendarDay(
      dateTime: DateTime.now(),
      isEmpty: true,
      isSelected: false,
      hasEvents: false,
      isToday: false);

  @override
  List<Object?> get props => [
        dateTime.microsecondsSinceEpoch,
        dateTime.month,
        dateTime.day,
        dateTime.year,
        isSelected,
        isToday,
        isEmpty,
        hasEvents
      ];
}
