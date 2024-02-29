abstract class FormFieldValidator {
  String? validate(String? fieldValue);
}

class TitleFieldValidator implements FormFieldValidator {
  TitleFieldValidator(this.defaultErrorMessage);
  final String defaultErrorMessage;

  @override
  String? validate(String? fieldValue) {
    if (fieldValue == null || fieldValue.isEmpty) {
      return defaultErrorMessage;
    }
    return null;
  }
}

class DescriptionFieldValidator implements FormFieldValidator {
  final String defaultErrorMessage;

  DescriptionFieldValidator(this.defaultErrorMessage);

  @override
  String? validate(String? fieldValue) {
    if (fieldValue == null || fieldValue.isEmpty) {
      return defaultErrorMessage;
    }
    return null;
  }
}

class DateFieldValidator implements FormFieldValidator {
  final String defaultErrorMessage;

  DateFieldValidator(this.defaultErrorMessage);

  @override
  String? validate(String? fieldValue) {
    if (fieldValue == null || fieldValue.isEmpty) {
      return defaultErrorMessage;
    }

    if (fieldValue.length < 10) {
      return defaultErrorMessage;
    }
    final splitedDate = fieldValue.split('/');
    final month = int.parse(splitedDate[0]);
    final day = int.parse(splitedDate[1]);
    final year = int.parse(splitedDate[2]);

    final lastDayOfthismonth = DateTime(year, month, 0);

    if (month > 12) {
      return 'Invalid month';
    }
    if (day > lastDayOfthismonth.day) {
      return 'Invalid day';
    }
    if (year < DateTime.now().year) {
      return 'Invalid year';
    }
    return null;
  }
}

class TimeFieldValidator implements FormFieldValidator {
  final String defaultErrorMessage;

  TimeFieldValidator(this.defaultErrorMessage);

  @override
  String? validate(String? fieldValue) {
    if (fieldValue == null || fieldValue.isEmpty) {
      return defaultErrorMessage;
    }

    if (fieldValue.length < 5) {
      return defaultErrorMessage;
    }

    final splitDate = fieldValue.split(':');
    final hour = int.parse(splitDate[0]);
    final minute = int.parse(splitDate[1]);

    if (hour > 24 || hour < 0) {
      return 'Invalid hour';
    }
    if (minute > 60 || minute < 0) {
      return 'Invalid minute';
    }
    return null;
  }
}
