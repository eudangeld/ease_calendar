import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoReminderSection extends StatelessWidget {
  const NoReminderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: SvgPicture.asset('/vectors/no_reminder_vector.svg'),
    );
  }
}
