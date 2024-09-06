import 'package:flutter/material.dart';

class ShowDateAndTime {
  static showDate(BuildContext context, {required Function(DateTime?) onValue}) {
    var firstDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    var lastDate = DateTime.now().add(const Duration(days: 365 * 2));
    showDatePicker(
            context: context,
            initialEntryMode: DatePickerEntryMode.inputOnly,
            initialDate: DateTime.now(),
            firstDate: firstDate,
            lastDate: lastDate)
        .then(onValue);
  }

  static showTime(BuildContext context, {required Function(TimeOfDay?) onValue}) {
    showTimePicker(
            context: context,
            initialEntryMode: TimePickerEntryMode.input,
            initialTime: TimeOfDay.now(),
            barrierDismissible: false)
        .then(onValue);
  }
}
