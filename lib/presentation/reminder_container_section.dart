import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/index.dart';
import 'index.dart';

class ReminderContainerSection extends StatelessWidget {
  ReminderContainerSection({super.key});

  final PageController pageController = PageController();

  final Map<RemindersScreen, int> screenMap = {
    RemindersScreen.list: 0,
    RemindersScreen.form: 1,
    RemindersScreen.loading: 2,
  };

  @override
  Widget build(BuildContext context) {
    return BlocListener<RemindersBloc, RemindersState>(
      child: PageView(
        // physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          const RemindersList(),
          ReminderForm(),
          const Center(child: CircularProgressIndicator()),
        ],
      ),
      listener: (context, state) {
        if (state.screen != null) {
          try {
            pageController.jumpToPage(screenMap[state.screen]!);
          } catch (_) {}
        }
        if (state is RemindersListState && state.shouldUpdateCalendar) {
          BlocProvider.of<CalendarBloc>(context)
              .add(GetCalendarMonthEvent(state.seddDate));
        }
      },
    );
  }
}
