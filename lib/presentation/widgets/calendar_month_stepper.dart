import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/util.dart';
import '../bloc/index.dart';

class CalendarMonthSteper extends StatelessWidget {
  const CalendarMonthSteper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: () {
              final nextSteppedDate = previusMonth(
                  BlocProvider.of<CalendarBloc>(context).state.currentTime);
              BlocProvider.of<CalendarBloc>(context)
                  .add(GetCalendarMonthEvent(nextSteppedDate));

              BlocProvider.of<RemindersBloc>(context)
                  .add(OpenRemindersListEvent(nextSteppedDate));
            },
            child: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            )),
        SvgPicture.asset('vectors/ponit_navigation.svg'),
        InkWell(
          onTap: () {
            final nextSteppedDate = nextMonth(
                BlocProvider.of<CalendarBloc>(context).state.currentTime);
            BlocProvider.of<CalendarBloc>(context)
                .add(GetCalendarMonthEvent(nextSteppedDate));

            BlocProvider.of<RemindersBloc>(context)
                .add(OpenRemindersListEvent(nextSteppedDate));
          },
          child: const Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
