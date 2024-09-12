import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/styles.dart';

import '../../../../core/utils/function/formatted_date.dart';
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
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment:
                    noteItemModel.note.dateTime!.isBefore(DateTime.now())
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.end,
                children: [
                  if (noteItemModel.note.dateTime!.isBefore(DateTime.now()))
                    Text('Completed', style: Styles.styleSemiBold14),
                  if (noteItemModel.note.dateTime!.isBefore(DateTime.now()))
                    const SizedBox(width: 24),
                  Text(
                      formattedData(date: noteItemModel.note.dateTime),
                      style: Styles.styleSemiBold14),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
