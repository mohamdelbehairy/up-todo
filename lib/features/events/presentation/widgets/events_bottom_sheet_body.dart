import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/styles.dart';
import 'package:up_todo/features/events/presentation/manager/store_events/store_events_cubit.dart';
import '../../../notes/data/repos/store_note/store_note_repo_impl.dart';
import 'events_text_fields_and_button_section.dart';

class EventsBottomSheetBody extends StatelessWidget {
  const EventsBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreEventsCubit(StoreNotesRepoImpl()),
      child: Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text('Add Event', style: Styles.styleBold26),
            const SizedBox(height: 8),
            const EventsTextFieldsAndButtonsSection(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
