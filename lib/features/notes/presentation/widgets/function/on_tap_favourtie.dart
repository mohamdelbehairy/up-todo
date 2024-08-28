import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import 'package:up_todo/features/notes/presentation/manager/get_notes/get_notes_cubit.dart';
import 'package:up_todo/features/notes/presentation/manager/remove_note/remove_note_cubit.dart';
import 'package:up_todo/features/notes/presentation/manager/store_note/store_note_cubit.dart';
import 'package:up_todo/features/notes/presentation/manager/update_note/update_note_cubit.dart';

Future<void> onTapFavourite(
    BuildContext context, NoteModel noteModel, int index) async {
  var getNotes = context.read<GetNotesCubit>();
  var removeNote = context.read<RemoveNoteCubit>();
  var updateNote = context.read<UpdateNoteCubit>();
  var storeNote = context.read<StoreNoteCubit>();
  GoRouter.of(context).pop();
  if (noteModel.isFavourite) {
    await removeNote.removeNote(
        noteID: index, boxName: Constants.kFavouriteNotes);
    await updateNote.updateNotes(
        index: index,
        boxName: Constants.kAllNotes,
        noteModel: NoteModel(
            title: noteModel.title, body: noteModel.body, isFavourite: false));
  } else {
    await updateNote.updateNotes(
        index: index,
        boxName: Constants.kAllNotes,
        noteModel: NoteModel(
            title: noteModel.title, body: noteModel.body, isFavourite: true));
    await storeNote.storeNote(
        noteModel: NoteModel(
            title: noteModel.title, body: noteModel.body, isFavourite: true),
        boxName: Constants.kFavouriteNotes);
  }

  getNotes.getAllNotes();
  getNotes.getFavouriteNotes();
}
