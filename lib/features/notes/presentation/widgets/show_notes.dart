import 'package:flutter/material.dart';
import 'show_note_grid_and_list_view.dart';
import 'show_notes_header.dart';

class ShowNotes extends StatelessWidget {
  const ShowNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShowNotesHeader(),
        SizedBox(height: 16),
        ShowNotesGridAndListView(),
        SizedBox(height: 4),
      ],
    );
  }
}


