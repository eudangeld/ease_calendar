import 'package:easy_calendar/core/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/index.dart';
import '../bloc/index.dart';

class ReminderTile extends StatelessWidget {
  const ReminderTile({
    required this.reminder,
    super.key,
  });

  final Reminder reminder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  spreadRadius: 2,
                  color: Color(0xFFD1DCF0),
                  blurRadius: 28,
                  offset: Offset(0, 4)),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 12,
                    height: 111,
                    decoration: BoxDecoration(
                        color: reminder.color,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .35,
                        child: Text(
                          reminder.title,
                          style: GoogleFonts.openSans().copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: const Color(0xff797979)),
                        ),
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .35,
                        child: Text(
                          reminder.description,
                          softWrap: true,
                          style: GoogleFonts.openSans().copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: const Color(0xff384042)),
                        ),
                      ),
                    ]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 1,
                  height: 111,
                  color: const Color(0xFFD1DCF0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('vectors/reminder_clock.svg',
                          color: const Color(0xFF797979)),
                      Text(
                        '${fillHourWithZeros(reminder.date)}:${fillMinutesWithZeros(reminder.date)}',
                        style: GoogleFonts.openSans().copyWith(
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF797979)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<RemindersBloc>(context).add(
                                OpenEditReminderScreenEvent(
                                    reminder: reminder));
                          },
                          child: SvgPicture.asset('vectors/edit_icon.svg'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
