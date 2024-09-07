import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/show_date_and_time.dart';
import 'package:up_todo/features/events/data/models/events_tap_model.dart';
import 'package:up_todo/features/notification/data/models/notification_model.dart';
import 'package:up_todo/features/notification/presentation/manager/notification/notification_cubit.dart';
import '../../../notes/data/models/note_model.dart';
import '../../data/models/events_form_model.dart';
import '../manager/store_events/store_events_cubit.dart';
import 'events_all_text_fields.dart';
import 'events_selected_date_time_and_save_button.dart';
import 'function/events_flutter_toast.dart';

class EventsForm extends StatefulWidget {
  const EventsForm({super.key, required this.eventsFormModel});

  final EventsFormModel eventsFormModel;

  @override
  State<EventsForm> createState() => _EventsFormState();
}

class _EventsFormState extends State<EventsForm> {
  DateTime? _dateTime;
  TimeOfDay _timeOfDay = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    var storeEvents = BlocProvider.of<StoreEventsCubit>(context);
    var notification = BlocProvider.of<NotificationCubit>(context);
    return Form(
      key: widget.eventsFormModel.formKey,
      child: Column(
        children: [
          EventsTextFieldsSection(items: widget.eventsFormModel.items),
          const SizedBox(height: 16),
          EventsSelectedDateTimeAndSaveButton(
            eventsTapModel: EventsTapModel(
                onTapSave: () async {
                  if (widget.eventsFormModel.formKey.currentState!.validate()) {
                    widget.eventsFormModel.formKey.currentState!.save();
                    if (_dateTime != null) {
                      if (_dateTime!.day > DateTime.now().day ||
                          (_timeOfDay.hour > DateTime.now().hour ||
                              (_timeOfDay.hour == DateTime.now().hour &&
                                  _timeOfDay.minute > DateTime.now().minute))) {
                        int id = Random().nextInt(1000);
                        await storeEvents.storeEvents(
                            noteModel: NoteModel(
                                id: id,
                                title: widget.eventsFormModel.title.text,
                                body: widget.eventsFormModel.decsription.text,
                                dateTime: DateTime(
                                    _dateTime!.year,
                                    _dateTime!.month,
                                    _dateTime!.day,
                                    _timeOfDay.hour,
                                    _timeOfDay.minute)));
                        await notification.showNotification(
                          notificationModel: NotificationModel(
                              id: id,
                              title: widget.eventsFormModel.title.text,
                              body: widget.eventsFormModel.decsription.text,
                              dateTime: DateTime(
                                  _dateTime!.year,
                                  _dateTime!.month,
                                  _dateTime!.day,
                                  _timeOfDay.hour,
                                  _timeOfDay.minute)),
                        );
                      } else {
                        eventsFlutterToast("Time in past is not allowed");
                      }
                    } else {
                      eventsFlutterToast("Date is empty");
                    }
                  }
                },
                onTapDate: _showDate,
                onTapTime: _showTime),
          ),
        ],
      ),
    );
  }
  void _showDate() {
    ShowDateAndTime.showDate(context, onValue: (value) {
      if (value != null) {
        setState(() {
          _dateTime = value;
        });
      }
    });
  }

  void _showTime() {
    ShowDateAndTime.showTime(context, onValue: (value) {
      if (value != null) {
        setState(() {
          _timeOfDay = value;
        });
      }
    });
  }
}
