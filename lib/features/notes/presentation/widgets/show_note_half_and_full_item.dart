import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/styles.dart';

import '../manager/selected_type_note/selected_type_note_cubit.dart';
import 'notes_divider.dart';

class ShowNoteHalfAndFullItem extends StatelessWidget {
  const ShowNoteHalfAndFullItem({super.key, this.width = 168});
  final double width;

  @override
  Widget build(BuildContext context) {
    var selectedIndex = context.watch<SelectedTypeNoteCubit>().selectedIndex;
    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
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
          Text('UX Design', style: Styles.styleSemiBold15),
          const NotesDivider(),
          Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consecteturelementum',
              style: Styles.styleLight12)
        ],
      ),
    );
  }
}
