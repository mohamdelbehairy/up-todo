import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/models/flutter_toast_model.dart';
import 'package:up_todo/core/utils/show_date_and_time.dart';
import 'package:up_todo/core/widgets/custom_flutter_toast.dart';
import 'package:up_todo/features/events/data/models/events_tap_model.dart';
import 'package:up_todo/features/events/presentation/manager/get_events/get_events_cubit.dart';
import '../../../../core/utils/colors.dart';
import '../../../notes/data/models/note_model.dart';
import '../../data/models/events_form_model.dart';
import '../manager/store_events/store_events_cubit.dart';
import 'events_all_text_fields.dart';
import 'events_selected_date_time_and_save_button.dart';

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
    return BlocListener<StoreEventsCubit, StoreEventsState>(
      listener: (context, state) {
        if (state is StoreEventsSuccess) {
          BlocProvider.of<GetEventsCubit>(context).getEvents();
          GoRouter.of(context).pop();
        }
      },
      child: Form(
        key: widget.eventsFormModel.formKey,
        child: Column(
          children: [
            EventsTextFieldsSection(items: widget.eventsFormModel.items),
            const SizedBox(height: 16),
            EventsSelectedDateTimeAndSaveButton(
              eventsTapModel: EventsTapModel(
                  onTapSave: () async {
                    if (widget.eventsFormModel.formKey.currentState!
                        .validate()) {
                      widget.eventsFormModel.formKey.currentState!.save();
                      if (_dateTime != null) {
                        if (_dateTime!.day > DateTime.now().day ||
                            (_timeOfDay.hour > DateTime.now().hour ||
                                (_timeOfDay.hour == DateTime.now().hour &&
                                    _timeOfDay.minute >
                                        DateTime.now().minute))) {
                          await BlocProvider.of<StoreEventsCubit>(context)
                              .storeEvents(
                                  noteModel: NoteModel(
                                      title: widget.eventsFormModel.title.text,
                                      body: widget
                                          .eventsFormModel.decsription.text,
                                      dateTime: DateTime(
                                          _dateTime!.year,
                                          _dateTime!.month,
                                          _dateTime!.day,
                                          _timeOfDay.hour,
                                          _timeOfDay.minute)));
                        } else {
                          CustomFlutterToast.showCustomFlutterToast(
                              flutterToastModel: FlutterToastModel(
                                  backgroundColor: AppColors.hiddenNotesColor,
                                  message: "Time in past is not allowed"));
                        }
                      } else {
                        CustomFlutterToast.showCustomFlutterToast(
                            flutterToastModel: FlutterToastModel(
                                backgroundColor: AppColors.hiddenNotesColor,
                                message: "Date is empty"));
                      }
                    }
                  },
                  onTapDate: _showDate,
                  onTapTime: _showTime),
            ),
          ],
        ),
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
