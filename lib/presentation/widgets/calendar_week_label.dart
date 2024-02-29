import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarWeekLabel extends StatelessWidget {
  const CalendarWeekLabel(
    this.weekDayLabel, {
    Key? key,
    required,
  }) : super(key: key);

  final String weekDayLabel;

  @override
  Widget build(BuildContext context) => Text(
        weekDayLabel,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
      );
}
