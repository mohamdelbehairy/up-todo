import 'package:flutter/widgets.dart';
import 'package:up_todo/core/widgets/search_text_field.dart';

import '../../../create_note/data/models/text_field_model.dart';
import 'selected_type_note_widget.dart';
import 'show_notes.dart';

class SearchAndSelectedAndShowNotesSection extends StatefulWidget {
  const SearchAndSelectedAndShowNotesSection({super.key});

  @override
  State<SearchAndSelectedAndShowNotesSection> createState() =>
      _SearchAndSelectedAndShowNotesSectionState();
}

class _SearchAndSelectedAndShowNotesSectionState
    extends State<SearchAndSelectedAndShowNotesSection> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchTextField(
            textFieldModel: TextFieldModel(
          controller: _controller,
        )),
        const SizedBox(height: 24),
        const SelectedTypeNoteWidget(),
        if (_controller.text.isEmpty) const ShowNotes(),
      ],
    );
  }
}
