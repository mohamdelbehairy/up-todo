import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/features/events/presentation/manager/store_events/store_events_cubit.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import '../../../create_note/data/models/text_field_model.dart';
import 'events_all_text_fields.dart';
import 'events_selected_date_time_and_save_button.dart';

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
        if(state is StoreEventsSuccess){
          GoRouter.of(context).pop();
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            EventsTextFieldsSection(items: items),
            const SizedBox(height: 16),
            EventsSelectedDateTimeAndSaveButton(
              onTapSave: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  await BlocProvider.of<StoreEventsCubit>(context).storeEvents(
                      noteModel:
                          NoteModel(title: title.text, body: decsription.text));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
