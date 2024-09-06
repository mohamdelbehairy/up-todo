import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/models/no_notes_found_model.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/styles.dart';

import '../../../../core/widgets/no_notes_found_widget.dart';
import '../manager/selected_type_note/selected_type_note_cubit.dart';

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
    var selectedIndex = context.watch<SelectedTypeNoteCubit>();
    return NoNotesFoundWidget(
        noNotesFoundModel: NoNotesFoundModel(
            style: Styles.styleItalic17.copyWith(color: Colors.white),
            backgroundColor: selectedIndex.selectedIndex == 0
                ? AppColors.allNotesColor
                : selectedIndex.selectedIndex == 1
                    ? AppColors.favouriteNotesColor
                    : selectedIndex.selectedIndex == 2
                        ? AppColors.hiddenNotesColor
                        : selectedIndex.selectedIndex == 3
                            ? AppColors.trashNotesColor
                            : Colors.white,
            text: 'No notes to display'));
  }
}
