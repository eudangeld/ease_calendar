import 'package:equatable/equatable.dart';
import '../../../domain/entities/calendar_day.dart';

enum CalendarStatus { filled, error, empty, loading }

class CalendarFullState extends Equatable {
  DateTime currentTime;
  final List<CalendarDay> month;
  final CalendarStatus status;
  CalendarFullState._(
      {required this.currentTime, required this.month, required this.status});

  CalendarFullState.filled(
    List<CalendarDay> month,
    DateTime currentTime,
  ) : this._(
          month: month,
          status: CalendarStatus.filled,
          currentTime: currentTime,
        );

  CalendarFullState.empty()
      : this._(
            month: [CalendarDay.empty()],
            status: CalendarStatus.empty,
            currentTime: DateTime.now());

  CalendarFullState.changeDayTime(DateTime newDateTime)
      : this._(
            month: [CalendarDay.empty()],
            status: CalendarStatus.empty,
            currentTime: newDateTime);
  CalendarFullState.loading()
      : this._(
            month: [CalendarDay.empty()],
            status: CalendarStatus.loading,
            currentTime: DateTime.now());

  @override
  List<Object?> get props => [status, currentTime];
}
