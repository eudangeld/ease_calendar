import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../core/util.dart';
import '../domain/usecases/index.dart';
import '../domain/validator/formfieldvalidater.dart';
import 'bloc/index.dart';
import 'widgets/index.dart';

class ReminderForm extends StatelessWidget {
  ReminderForm({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  bool isReminderEdit = false;

  // only when editing is true :(
  String reminderId = '';

  late String selectedColor = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemindersBloc, RemindersState>(
        builder: (context, snapshot) {
      final currentCalendarDate =
          BlocProvider.of<CalendarBloc>(context).state.currentTime;

      isReminderEdit = false;
      clearTextControllers();
      if (snapshot is EditReminderState) {
        reminderId = snapshot.reminder.id!;
        isReminderEdit = true;
        titleController.text = snapshot.reminder.title;
        descriptionController.text = snapshot.reminder.description;
        dateController.text =
            extractStringDateFromDateObject(snapshot.reminder.date);
        timeController.text = extractStringTimeFromDate(snapshot.reminder.date);
      }

      return Shortcuts(
        shortcuts: const <ShortcutActivator, Intent>{
          SingleActivator(LogicalKeyboardKey.tab): NextFocusIntent()
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 30, top: 45),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(dateObjectToPresentationDate(currentCalendarDate),
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600, fontSize: 24)),
                ),
                BaseFormField(
                    maxChars: 30,
                    textEditController: titleController,
                    validator:
                        TitleFieldValidator('Title must be completed').validate,
                    hintText: 'Title'),
                BaseFormField(
                    maxChars: 1000,
                    textEditController: descriptionController,
                    validator: DescriptionFieldValidator(
                            'Description must be completed')
                        .validate,
                    hintText: 'Description',
                    largeText: true),
                Row(children: [
                  Expanded(
                    child: BaseFormField(
                        maxChars: 10,
                        textEditController: dateController
                          ..text = extractStringDateFromDateObject(
                              currentCalendarDate),
                        textMask: dateMaskFormater,
                        validator: DateFieldValidator('Date must be completed')
                            .validate,
                        hintText: 'MM/DD/YYYY',
                        label: 'Date'),
                  ),
                  const SizedBox(width: 35),
                  Expanded(
                    child: BaseFormField(
                      maxChars: 5,
                      textEditController: timeController,
                      textMask: timeMaskFormater,
                      validator:
                          TimeFieldValidator('Time must be completed').validate,
                      hintText: 'HH:MM',
                      label: 'Time',
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ColorPalette(onSelectCallback: onSelectCallback),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (isReminderEdit)
                      ActionButton(
                        buttonType: ButtonType.remove,
                        callBack: () => BlocProvider.of<RemindersBloc>(context)
                            .add(DeleteReminderEvent(DeleteReminderParams(
                          currentDate: currentCalendarDate,
                          id: reminderId,
                        ))),
                      ),
                    Row(children: [
                      ActionButton(
                        buttonType: ButtonType.cancel,
                        callBack: () => BlocProvider.of<RemindersBloc>(context)
                            .add(OpenRemindersListEvent(currentCalendarDate)),
                      ),
                      const SizedBox(width: 10),
                      ActionButton(
                        buttonType: ButtonType.save,
                        callBack: () => validateForm(context),
                      ),
                    ])
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  validateForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final String titleValue = titleController.text;
      final String descriptionValue = descriptionController.text;
      final List<String> dateValue = dateController.text.split('/');
      final List<String> timeValue = timeController.text.split(':');

      final month = int.parse(dateValue[0]);
      final day = int.parse(dateValue[1]);
      final year = int.parse(dateValue[2]);
      final hour = int.parse(timeValue[0]);
      final minute = int.parse(timeValue[1]);

      final DateTime fullDate = DateTime(year, month, day, hour, minute);

      if (isReminderEdit) {
        final EditReminderParams editParams = EditReminderParams(
          id: reminderId,
          title: titleValue,
          description: descriptionValue,
          date: fullDate.toIso8601String(),
          color: selectedColor.isEmpty ? '#ffffff' : selectedColor,
        );
        BlocProvider.of<RemindersBloc>(context)
            .add(EditReminderEvent(editParams));
      } else {
        final CreateReminderParams formData = CreateReminderParams(
          title: titleValue,
          date: fullDate.toIso8601String(),
          description: descriptionValue,
          color: selectedColor.isEmpty ? '#ffffff' : selectedColor,
        );
        BlocProvider.of<RemindersBloc>(context).add(
            CreateReminderEvent(formData: formData, currentDate: fullDate));
      }
    }
  }

  onSelectCallback(String color) {
    selectedColor = color;
  }

  void clearTextControllers() {
    titleController.text = '';
    descriptionController.text = '';
    dateController.text = '';
    timeController.text = '';
  }
}

final dateMaskFormater = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);
final timeMaskFormater = MaskTextInputFormatter(
    mask: '##:##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);
