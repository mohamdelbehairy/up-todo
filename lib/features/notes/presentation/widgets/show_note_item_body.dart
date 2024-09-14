import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/styles.dart';

import '../../data/models/note_item_model.dart';
import 'notes_divider.dart';

class ShowNoteItemBody extends StatelessWidget {
  const ShowNoteItemBody({super.key, required this.noteItemModel});

  final NoteItemModel noteItemModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
              child: Text(noteItemModel.note.title,
                  style: Styles.styleSemiBold15.copyWith(fontSize: 16))),
          const NotesDivider(),
          Text(noteItemModel.note.body, style: Styles.styleSemiBold15)
        ],
      ),
    );
  }
}
