import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';

import '../../manager/get_notes/get_notes_cubit.dart';
import '../../manager/remove_note/remove_note_cubit.dart';
import '../../manager/store_note/store_note_cubit.dart';

Future<void> onTapTrash(
    BuildContext context, NoteModel noteModel, int index) async {
  GoRouter.of(context).pop();
  var getNotes = context.read<GetNotesCubit>();
  var removeNote = context.read<RemoveNoteCubit>();
  var storeNote = context.read<StoreNoteCubit>();

  if (noteModel.isTrash) {
    await storeNote.storeNote(
        noteModel: NoteModel(
            title: noteModel.title, body: noteModel.body, isTrash: false),
        boxName: Constants.kAllNotes);
    await removeNote.removeNote(noteID: index, boxName: Constants.kTrashNotes);
  } else {
    if (noteModel.isFavourite) {
      await removeNote.removeNote(
          noteID: index, boxName: Constants.kFavouriteNotes);
    }
    if (noteModel.isHidden) {
      await removeNote.removeNote(
          noteID: index, boxName: Constants.kHiddenNotes);
    }
    await storeNote.storeNote(
        noteModel: NoteModel(
            title: noteModel.title, body: noteModel.body, isTrash: true),
        boxName: Constants.kTrashNotes);
    await removeNote.removeNote(noteID: index, boxName: Constants.kAllNotes);
  }
  getNotes.getFavouriteNotes();
  getNotes.getHiddenNotes();
  getNotes.getTrashNotes();
  getNotes.getAllNotes();
}
