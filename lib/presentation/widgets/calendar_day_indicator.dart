import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/util.dart';
import '../../domain/entities/index.dart';
import '../bloc/index.dart';

class CalendarDayIndicator extends StatelessWidget {
  const CalendarDayIndicator(
    this.calendarDay, {
    super.key,
  });

  final CalendarDay calendarDay;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemindersBloc, RemindersState>(
        builder: (context, snapshot) {
      final currentDate =
          BlocProvider.of<CalendarBloc>(context).state.currentTime;

      if (calendarDay.isEmpty) return const SizedBox.shrink();

      return InkWell(
        onTap: () {
          BlocProvider.of<CalendarBloc>(context).state.currentTime =
              calendarDay.dateTime;

          BlocProvider.of<RemindersBloc>(context)
              .add(OpenRemindersListEvent(calendarDay.dateTime));
        },
        child: Container(
          decoration: checkSameDay(calendarDay.dateTime, currentDate) &&
                  !calendarDay.isEmpty
              ? const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xffFF465D),
                        Color(0xffBC46BA),
                      ]))
              : null,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: EventDot(day: calendarDay),
                )),
                Expanded(
                  child: Text(
                    !calendarDay.isEmpty
                        ? calendarDay.dateTime.day.toString()
                        : '',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        height: .4,
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: calendarDay.isToday
                            ? FontWeight.bold
                            : FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class EventDot extends StatelessWidget {
  const EventDot({super.key, required this.day});

  final CalendarDay day;

  @override
  Widget build(BuildContext context) {
    final dotColor = day.hasEvents && !day.isEmpty
        ? const Color(0xFF00FFCC)
        : Colors.transparent;
    return Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
    );
  }
}
