import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/index.dart';
import 'index.dart';
import 'widgets/index.dart';

class RemindersList extends StatelessWidget {
  const RemindersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemindersBloc, RemindersState>(
        listener: (context, state) {
      if (state is RemindersListState) {
        if (state.shouldUpdateCalendar) {
          BlocProvider.of<CalendarBloc>(context)
              .add(GetCalendarMonthEvent(state.seddDate));
        }
      }
    }, builder: (context, state) {
      if (state is RemindersListState) {
        return Column(
          children: [
            const ReminderHeader(),
            if (state.reminders.isEmpty) const NoReminderSection(),
            if (state.reminders.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.reminders.length,
                  itemBuilder: (context, index) {
                    return ReminderTile(reminder: state.reminders[index]);
                  },
                ),
              ),
          ],
        );
      }

      return Container();
    });
  }
}
