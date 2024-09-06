import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/styles.dart';

import '../../../notes/data/models/note_item_model.dart';

class EventsItem extends StatelessWidget {
  const EventsItem({super.key, required this.noteItemModel});

  final NoteItemModel noteItemModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: noteItemModel.onTap,
      onLongPress: noteItemModel.onLongTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(
                color: noteItemModel.isActive
                    ? AppColors.secondaryColor
                    : Colors.transparent),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
                child: Text(noteItemModel.note.title,
                    style: Styles.styleSemiBold15)),
            const SizedBox(height: 8),
            Text(noteItemModel.note.body, style: Styles.styleRegular13),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: Text('06 September, 2024 At 18:20',
                  style: Styles.styleSemiBold14),
            )
          ],
        ),
      ),
    );
  }
}
