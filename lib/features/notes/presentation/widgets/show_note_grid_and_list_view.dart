import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/search/presentation/manager/search/search_cubit.dart';
import '../../data/models/note_model.dart';
import '../manager/get_notes/get_notes_cubit.dart';
import '../manager/selected_type_note/selected_type_note_cubit.dart';
import 'show_no_notes_founded.dart';
import 'show_notes_grid_view.dart';
import 'show_notes_list_view.dart';

class ShowNotesGridAndListView extends StatelessWidget {
  const ShowNotesGridAndListView({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var notes = BlocProvider.of<GetNotesCubit>(context);
    var searchNotes = context.watch<SearchCubit>();
    var selectedIndex = context.watch<SelectedTypeNoteCubit>();

    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        final List<NoteModel> note;

        if (controller.text.isEmpty) {
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
        } else {
          if (selectedIndex.selectedIndex == 0) {
            note = searchNotes.displayAllNotes;
          } else if (selectedIndex.selectedIndex == 1) {
            // note = notes.favouriteNotes;
             note = [];
          } else if (selectedIndex.selectedIndex == 2) {
            // note = notes.hiddenNotes;
             note = [];
          } else if (selectedIndex.selectedIndex == 3) {
            // note = notes.trashNotes;
            note = [];
          } else {
            note = searchNotes.displayAllNotes;
          }
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
            ShowNotesListView(notes: listNotes),
            if (notes.recentNotes.isEmpty && selectedIndex.selectedIndex == -1)
              const NoRecentFounded(),
            if (notes.allNotes.isEmpty && selectedIndex.selectedIndex == 0)
              const NoAllNotesFounded(),
            if (notes.favouriteNotes.isEmpty &&
                selectedIndex.selectedIndex == 1)
              const NoAllNotesFounded(),
            if (notes.hiddenNotes.isEmpty && selectedIndex.selectedIndex == 2)
              const NoAllNotesFounded(),
            if (notes.trashNotes.isEmpty && selectedIndex.selectedIndex == 3)
              const NoAllNotesFounded(),
          ],
        );
      },
    );
  }
}
