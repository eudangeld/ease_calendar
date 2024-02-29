import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/util.dart';
import '../bloc/index.dart';
import 'index.dart';

class ReminderHeader extends StatelessWidget {
  const ReminderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemindersBloc, RemindersState>(
        builder: (context, snapshot) {
      if (snapshot is RemindersListState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(dateObjectToPresentationDate(snapshot.seddDate),
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600, fontSize: 24)),
              const AddReminderHeaderButton()
            ],
          ),
        );
      }

      return Container();
    });
  }
}
