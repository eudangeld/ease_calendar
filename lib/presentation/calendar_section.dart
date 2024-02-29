import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../calendar/calendar_utils.dart';
import '../core/util.dart';
import 'bloc/index.dart';
import 'widgets/index.dart';

class CalendarSection extends StatelessWidget {
  CalendarSection({super.key});

  final CalendarUtils monthUtil = CalendarUtils();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarFullState>(
      builder: (context, state) {
        if (state.status == CalendarStatus.empty) {
          BlocProvider.of<RemindersBloc>(context)
              .add(OpenRemindersListEvent(DateTime.now()));

          BlocProvider.of<CalendarBloc>(context)
              .add(GetCalendarMonthEvent(DateTime.now()));
        }

        if (state.status == CalendarStatus.error) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == CalendarStatus.filled) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff101277), Color(0xff421F91)],
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(state.currentTime.year.toString(),
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w800,
                              height: 1,
                              wordSpacing: .1,
                              fontSize: 80,
                              color: Colors.white)),
                      Text(monthNames[state.month[8].dateTime.month - 1],
                          style: GoogleFonts.openSans(
                              fontSize: 40,
                              height: .8,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 35, bottom: 20),
                  child: CalendarMonthSteper(),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: .2,
                      crossAxisCount: 7,
                      children: [
                        ...weekDaysLabel.map(CalendarWeekLabel.new),
                        ...state.month.map(CalendarDayIndicator.new)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff101277), Color(0xff421F91)],
              ),
            ),
            child: const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
