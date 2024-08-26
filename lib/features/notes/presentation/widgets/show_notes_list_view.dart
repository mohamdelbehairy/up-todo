import 'package:flutter/material.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';

import 'show_note_half_and_full_item.dart';

class ShowNotesListView extends StatelessWidget {
  const ShowNotesListView({super.key, required this.note});
  final List<NoteModel> note;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: note.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: ShowNoteHalfAndFullItem(width: double.infinity));
      },
    );
  }
}
