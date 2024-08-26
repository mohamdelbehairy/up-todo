import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';

import '../../data/models/note_item_model.dart';
import '../manager/selected_type_note/selected_type_note_cubit.dart';
import 'show_note_item.dart';

class ShowNotesListView extends StatelessWidget {
  const ShowNotesListView({super.key, required this.notes});
  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: notes.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: ShowNoteItem(
              noteItemModel: NoteItemModel(
                  width: double.infinity,
                  note: notes[index],
                  onTap: () {
                    context
                        .read<SelectedTypeNoteCubit>()
                        .listViewChangeIndex(index);
                    context
                        .read<SelectedTypeNoteCubit>()
                        .gradeViewChangeIndex(-1);
                  },
                  isActive: context
                          .read<SelectedTypeNoteCubit>()
                          .listViewAvtiveIndex ==
                      index),
            ));
      },
    );
  }
}
