import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';

import '../../data/models/note_item_model.dart';
import '../manager/get_notes/get_notes_cubit.dart';
import 'show_note_half_and_full_item.dart';

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
            child: ShowNoteHalfAndFullItem(
              noteItemModel: NoteItemModel(
                  width: double.infinity,
                  note: notes[index],
                  onTap: () {
                    context.read<GetNotesCubit>().listViewChangeIndex(index);
                    context.read<GetNotesCubit>().gradeViewChangeIndex(-1);
                  },
                  isActive: context.read<GetNotesCubit>().listViewAvtiveIndex ==
                      index),
            ));
      },
    );
  }
}
