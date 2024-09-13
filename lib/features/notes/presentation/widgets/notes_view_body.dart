import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/function/formatted_date.dart';
import 'package:up_todo/core/utils/styles.dart';
import '../manager/selected_type_note/selected_type_note_cubit.dart';
import 'notes_view_selected_and_unseclected_app_bar.dart';
import 'search_and_selected_and_show_notes_section.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedIndex = context.read<SelectedTypeNoteCubit>();
    return BlocBuilder<SelectedTypeNoteCubit, SelectedTypeNoteState>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (selectedIndex.selectedIndex == -1) const SizedBox(height: 32),
              if (selectedIndex.selectedIndex != -1) const SizedBox(height: 50),
              if (selectedIndex.selectedIndex == -1)
                Text(formattedData(), style: Styles.styleRegular13),
              if (selectedIndex.selectedIndex == -1)
                const NoteViewUnSelectedAppBar(),
              if (selectedIndex.selectedIndex != -1)
                const NoteViewSelectedAppBar(),
              const SizedBox(height: 16),
              const SearchAndSelectedAndShowNotesSection(),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}
