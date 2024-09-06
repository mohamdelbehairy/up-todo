import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/features/events/data/models/events_form_model.dart';
import 'package:up_todo/features/events/presentation/manager/notification/notification_cubit.dart';
import 'package:up_todo/features/events/presentation/manager/store_events/store_events_cubit.dart';
import '../../../create_note/data/models/text_field_model.dart';
import '../manager/get_events/get_events_cubit.dart';
import 'events_form.dart';

class EventsTextFieldsAndButtonsSection extends StatefulWidget {
  const EventsTextFieldsAndButtonsSection({super.key});

  @override
  State<EventsTextFieldsAndButtonsSection> createState() =>
      _EventsTextFieldsAndButtonsSectionState();
}

class _EventsTextFieldsAndButtonsSectionState
    extends State<EventsTextFieldsAndButtonsSection> {
  late TextEditingController title, decsription;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    title = TextEditingController();
    decsription = TextEditingController();
    context.read<NotificationCubit>().initNotification();
    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    decsription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TextFieldModel> items = [
      TextFieldModel(
          title: 'Event Title',
          controller: title,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter a title';
            }
            if (value.length < 5) {
              return 'Title must be at least 5 characters';
            }
            if (value.length > 20) {
              return 'Title must be less than 20 characters';
            }
            return null;
          }),
      TextFieldModel(
          title: 'Event Description',
          controller: decsription,
          validator: (value) {
            if (value!.isEmpty &&
                title.text.isNotEmpty &&
                title.text.length >= 5 &&
                title.text.length < 20) {
              return 'Please enter a description';
            }
            if (value.length < 5 &&
                title.text.isNotEmpty &&
                title.text.length >= 5 &&
                title.text.length < 20) {
              return 'Description must be at least 5 characters';
            }
            if (value.length > 40 &&
                title.text.isNotEmpty &&
                title.text.length >= 5 &&
                title.text.length < 20) {
              return 'Description must be less than 40 characters';
            }
            return null;
          }),
    ];
    return BlocListener<StoreEventsCubit, StoreEventsState>(
      listener: (context, state) {
        if (state is StoreEventsSuccess) {
          GoRouter.of(context).pop();
          BlocProvider.of<GetEventsCubit>(context).getEvents();
        }
      },
      child: EventsForm(
          eventsFormModel: EventsFormModel(
              formKey: formKey,
              items: items,
              title: title,
              decsription: decsription)),
    );
  }
}
