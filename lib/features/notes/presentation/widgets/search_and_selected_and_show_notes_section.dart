import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/widgets/search_text_field.dart';

import '../../../create_note/data/models/text_field_model.dart';
import '../../../search/presentation/manager/search/search_cubit.dart';
import '../manager/selected_type_note/selected_type_note_cubit.dart';
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
    var notes = context.watch<SearchCubit>();
    var selectedIndex = context.read<SelectedTypeNoteCubit>();

    return Column(
      children: [
        SearchTextField(
            textFieldModel: TextFieldModel(
                controller: _controller,
                onChanged: (value) {
                  if (selectedIndex.selectedIndex == 1) {
                    notes.searchFavoriteNotes(value);
                  } else if (selectedIndex.selectedIndex == 2) {
                    notes.searchHiddenNotes(value);
                  } else if (selectedIndex.selectedIndex == 3) {
                    notes.searchTrashNotes(value);
                  } else {
                    notes.searchAllNotes(value);
                  }
                },
                suffixTap: () {
                  _controller.clear();
                  notes.searchAllNotes('');
                })),
        const SizedBox(height: 24),
        SelectedTypeNoteWidget(controller: _controller),
        ShowNotes(controller: _controller),
      ],
    );
  }
}
