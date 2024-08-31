import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import '../../manager/get_notes/get_notes_cubit.dart';
import '../../manager/remove_note/remove_note_cubit.dart';
import '../../manager/store_note/store_note_cubit.dart';

Future<void> onTapHidden(
    BuildContext context, NoteModel noteModel, int index) async {
  var getNotes = context.read<GetNotesCubit>();
  var removeNote = context.read<RemoveNoteCubit>();
  var storeNote = context.read<StoreNoteCubit>();
  
  GoRouter.of(context).pop();

  if (noteModel.isHidden) {
    await storeNote.storeNote(
        noteModel: NoteModel(
            title: noteModel.title, body: noteModel.body, isHidden: false),
        boxName: Constants.kAllNotes);
    if (noteModel.isFavourite) {
      await storeNote.storeNote(
          noteModel: noteModel, boxName: Constants.kFavouriteNotes);
    }
    await removeNote.removeNote(noteID: index, boxName: Constants.kHiddenNotes);
  } else {
    if (noteModel.isFavourite) {
      await storeNote.storeNote(
          noteModel: NoteModel(
              title: noteModel.title,
              body: noteModel.body,
              isFavourite: true,
              isHidden: true),
          boxName: Constants.kHiddenNotes);
      await removeNote.removeNote(
          noteID: index, boxName: Constants.kFavouriteNotes);
    } else {
      await storeNote.storeNote(
          noteModel: NoteModel(
              title: noteModel.title, body: noteModel.body, isHidden: true),
          boxName: Constants.kHiddenNotes);
    }
    await removeNote.removeNote(noteID: index, boxName: Constants.kAllNotes);
  }
  getNotes.getFavouriteNotes();
  getNotes.getHiddenNotes();
  getNotes.getAllNotes();
}
