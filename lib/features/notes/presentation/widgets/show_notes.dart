import 'package:flutter/material.dart';
import 'show_note_grid_and_list_view.dart';
import 'show_notes_header.dart';

class ShowNotes extends StatelessWidget {
  const ShowNotes({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShowNotesHeader(),
        const SizedBox(height: 16),
        ShowNotesGridAndListView(controller: controller),
        const SizedBox(height: 4),
      ],
    );
  }
}
