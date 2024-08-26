import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/colors.dart';

import '../../data/models/note_item_model.dart';
import 'show_note_item_body.dart';

class ShowAllNotes extends StatelessWidget {
  const ShowAllNotes({super.key, required this.noteItemModel});
  final NoteItemModel noteItemModel;

  @override
  Widget build(BuildContext context) {
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
            color: AppColors.allNotesColor,
            borderRadius: BorderRadius.circular(10)),
        child: ShowNoteItemBody(noteItemModel: noteItemModel),
      ),
    );
  }
}

class ShowRecentNotes extends StatelessWidget {
  const ShowRecentNotes({super.key, required this.noteItemModel});
  final NoteItemModel noteItemModel;

  @override
  Widget build(BuildContext context) {
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
                    ? AppColors.secondaryColor
                    : Colors.transparent),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: ShowNoteItemBody(noteItemModel: noteItemModel),
      ),
    );
  }
}

class ShowFavoriteNotes extends StatelessWidget {
  const ShowFavoriteNotes({super.key, required this.noteItemModel});
  final NoteItemModel noteItemModel;

  @override
  Widget build(BuildContext context) {
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
                    ? const Color(0xffF7CE45)
                    : Colors.transparent),
            color: AppColors.favouriteNotesColor,
            borderRadius: BorderRadius.circular(10)),
        child: ShowNoteItemBody(noteItemModel: noteItemModel),
      ),
    );
  }
}

class ShowHiddenNotes extends StatelessWidget {
  const ShowHiddenNotes({super.key, required this.noteItemModel});
  final NoteItemModel noteItemModel;

  @override
  Widget build(BuildContext context) {
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
                    ? const Color(0xff4E94F8)
                    : Colors.transparent),
            color: AppColors.hiddenNotesColor,
            borderRadius: BorderRadius.circular(10)),
        child: ShowNoteItemBody(noteItemModel: noteItemModel),
      ),
    );
  }
}

class ShowTrashNotes extends StatelessWidget {
  const ShowTrashNotes({super.key, required this.noteItemModel});
  final NoteItemModel noteItemModel;

  @override
  Widget build(BuildContext context) {
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
                    ? const Color(0xffEB4D3D)
                    : Colors.transparent),
            color: AppColors.trashNotesColor,
            borderRadius: BorderRadius.circular(10)),
        child: ShowNoteItemBody(noteItemModel: noteItemModel),
      ),
    );
  }
}
