import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/styles.dart';

import '../../data/models/note_item_model.dart';
import '../manager/selected_type_note/selected_type_note_cubit.dart';
import 'notes_divider.dart';

class ShowNoteHalfAndFullItem extends StatelessWidget {
  const ShowNoteHalfAndFullItem({super.key, required this.noteItemModel});
  final NoteItemModel noteItemModel;

  @override
  Widget build(BuildContext context) {
    var selectedIndex = context.watch<SelectedTypeNoteCubit>().selectedIndex;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: noteItemModel.onTap,
      child: Container(
        width: noteItemModel.width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(
                color: noteItemModel.isActive
                    ? const Color(0xff8E8E92)
                    : Colors.transparent),
            color: selectedIndex == 0
                ? AppColors.allNotesColor
                : selectedIndex == 1
                    ? AppColors.favouriteNotesColor
                    : selectedIndex == 2
                        ? AppColors.hiddenNotesColor
                        : selectedIndex == 3
                            ? AppColors.trashNotesColor
                            : Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
                child: Text(noteItemModel.note.title,
                    style: Styles.styleSemiBold15)),
            const NotesDivider(),
            Text(noteItemModel.note.body, style: Styles.styleLight12)
          ],
        ),
      ),
    );
  }
}
