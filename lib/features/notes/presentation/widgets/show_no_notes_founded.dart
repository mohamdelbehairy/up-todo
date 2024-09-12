import 'package:flutter/material.dart';
import 'package:up_todo/core/models/no_notes_found_model.dart';
import '../../../../core/widgets/no_notes_found_widget.dart';

class NoRecentFounded extends StatelessWidget {
  const NoRecentFounded({super.key});

  @override
  Widget build(BuildContext context) {
    return NoNotesFoundWidget(
        noNotesFoundModel:
            NoNotesFoundModel(text: 'No recent notes to display'));
  }
}

class NoAllNotesFounded extends StatelessWidget {
  const NoAllNotesFounded({super.key});

  @override
  Widget build(BuildContext context) {
    return NoNotesFoundWidget(
        noNotesFoundModel: NoNotesFoundModel(text: 'No notes to display'));
  }
}
