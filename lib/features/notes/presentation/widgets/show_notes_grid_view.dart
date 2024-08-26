import 'package:flutter/material.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';

import 'show_note_half_and_full_item.dart';

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
          crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
      itemBuilder: (context, index) {
        return const ShowNoteHalfAndFullItem();
      },
    );
  }
}
