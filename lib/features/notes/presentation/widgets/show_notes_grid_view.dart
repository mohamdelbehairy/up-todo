import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/notes/data/models/note_item_model.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import 'package:up_todo/features/notes/presentation/manager/selected_type_note/selected_type_note_cubit.dart';

import 'show_note_item.dart';

class ShowNotesGridView extends StatelessWidget {
  const ShowNotesGridView({super.key, required this.notes});
  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: notes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          // mainAxisExtent: 140,
          crossAxisSpacing: 8),
      itemBuilder: (context, index) {
        return ShowNoteItem(
          noteItemModel: NoteItemModel(
              note: notes[index],
              onTap: () {
                context
                    .read<SelectedTypeNoteCubit>()
                    .gradeViewChangeIndex(index);
                context.read<SelectedTypeNoteCubit>().listViewChangeIndex(-1);
              },
              isActive:
                  context.read<SelectedTypeNoteCubit>().gridViewAvtiveIndex ==
                      index),
        );
      },
    );
  }
}
