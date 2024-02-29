import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'injection_container.dart';
import 'presentation/bloc/index.dart';
import 'presentation/index.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<CalendarBloc>()),
        BlocProvider(create: (context) => serviceLocator<RemindersBloc>()),
      ],
      child: const MaterialApp(
        title: 'Easy calendar by codelitt',
        home: HomeContainer(),
      ),
    );
  }
}

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffEBF3FE),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 30,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Expanded(flex: 4, child: ReminderContainerSection()),
                      Expanded(flex: 2, child: CalendarSection()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
