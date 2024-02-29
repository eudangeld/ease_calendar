import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/index.dart';

class AddReminderHeaderButton extends StatelessWidget {
  const AddReminderHeaderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          BlocProvider.of<RemindersBloc>(context).add(OpenReminderFormEvent()),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [Color(0xffFF465D), Color(0xffBC46BA)],
          ),
          boxShadow: const [
            BoxShadow(
                spreadRadius: 2,
                color: Color(0xFFD1DCF0),
                blurRadius: 28,
                offset: Offset(0, 4)),
          ],
        ),
        child: Center(
          child: Text(
            'Add reminder',
            style: GoogleFonts.openSans().copyWith(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
