import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/notes/presentation/manager/get_notes/get_notes_cubit.dart';

import '../../data/models/note_model.dart';
import '../manager/selected_type_note/selected_type_note_cubit.dart';
import 'show_notes_grid_view.dart';
import 'show_notes_list_view.dart';

class ShowNotesGridAndListView extends StatelessWidget {
  const ShowNotesGridAndListView({super.key});

  @override
  Widget build(BuildContext context) {
    var notes = BlocProvider.of<GetNotesCubit>(context);
    var selectedIndex = context.watch<SelectedTypeNoteCubit>();

    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        final List<NoteModel> note;

        if (selectedIndex.selectedIndex == 0) {
          note = notes.allNotes;
        } else if (selectedIndex.selectedIndex == 1) {
          note = notes.favouriteNotes;
        } else if (selectedIndex.selectedIndex == 2) {
          note = notes.hiddenNotes;
        } else if (selectedIndex.selectedIndex == 3) {
          note = notes.trashNotes;
        } else {
          note = notes.recentNotes;
        }
        final List<NoteModel> gridNotes =
            note.length > 2 ? note.sublist(0, 2) : note;
        final List<NoteModel> listNotes =
            note.length > 2 ? note.sublist(2) : [];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShowNotesGridView(notes: gridNotes),
            const SizedBox(height: 12),
            ShowNotesListView(note: listNotes),
          ],
        );
      },
    );
  }
}
