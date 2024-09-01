import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/core/widgets/custom_flutter_toast.dart';

import '../../../../../core/models/flutter_toast_model.dart';
import '../../../data/models/note_model.dart';
import '../../manager/get_notes/get_notes_cubit.dart';
import '../../manager/remove_note/remove_note_cubit.dart';
import '../../manager/selected_type_note/selected_type_note_cubit.dart';
import '../../manager/store_note/store_note_cubit.dart';
import '../../manager/update_note/update_note_cubit.dart';

Future<void> onTapAllTrash(BuildContext context) async {
  var selectedIndex = context.read<SelectedTypeNoteCubit>().selectedIndex;
  var getNotes = context.read<GetNotesCubit>();
  var removeAllNotes = context.read<RemoveNoteCubit>();
  var updateAllNotes = context.read<UpdateNoteCubit>();
  var storeNotes = context.read<StoreNoteCubit>();

  if (selectedIndex == 0) {
    if (getNotes.allNotes.isNotEmpty) {
      for (var key in getNotes.getNotesToMap(Constants.kAllNotes).keys) {
        var note =
            getNotes.getNotesToMap(Constants.kAllNotes)[key] as NoteModel;
        if (note.isFavourite) {
          await updateAllNotes.updateNotesWithKey(
              key: key,
              boxName: Constants.kAllNotes,
              noteModel: NoteModel(
                  title: note.title,
                  body: note.body,
                  isFavourite: false,
                  isHidden: note.isHidden,
                  isTrash: note.isTrash));
          await removeAllNotes.removeAllNotes(
              boxName: Constants.kFavouriteNotes);
        }
      }
      for (var note in getNotes.allNotes) {
        await storeNotes.storeNote(
            noteModel: NoteModel(
                title: note.title,
                body: note.body,
                isFavourite: false,
                isHidden: note.isHidden,
                isTrash: true),
            boxName: Constants.kTrashNotes);
        await removeAllNotes.removeAllNotes(boxName: Constants.kAllNotes);
      }
      CustomFlutterToast.showCustomFlutterToast(
          flutterToastModel: FlutterToastModel(
              message: 'All notes added to trash',
              backgroundColor: AppColors.allNotesColor));
    } else {
      CustomFlutterToast.showCustomFlutterToast(
          flutterToastModel: FlutterToastModel(
              message: 'All notes are empty',
              backgroundColor: AppColors.allNotesColor));
    }
  } else if (selectedIndex == 2) {
    if (getNotes.hiddenNotes.isNotEmpty) {
      for (var note in getNotes.hiddenNotes) {
        await storeNotes.storeNote(
            noteModel: NoteModel(
                title: note.title,
                body: note.body,
                isFavourite: false,
                isHidden: false,
                isTrash: true),
            boxName: Constants.kTrashNotes);
        await removeAllNotes.removeAllNotes(boxName: Constants.kHiddenNotes);
      }
      CustomFlutterToast.showCustomFlutterToast(
          flutterToastModel: FlutterToastModel(
              message: 'All notes added to trash',
              backgroundColor: AppColors.hiddenNotesColor));
    } else {
      CustomFlutterToast.showCustomFlutterToast(
          flutterToastModel: FlutterToastModel(
              message: 'All notes are empty',
              backgroundColor: AppColors.hiddenNotesColor));
    }
  } else {
    if (getNotes.trashNotes.isNotEmpty) {
      for (var note in getNotes.trashNotes) {
        await storeNotes.storeNote(
            noteModel: NoteModel(title: note.title, body: note.body),
            boxName: Constants.kAllNotes);
        await removeAllNotes.removeAllNotes(boxName: Constants.kTrashNotes);
      }
      CustomFlutterToast.showCustomFlutterToast(
          flutterToastModel: FlutterToastModel(
              message: 'All notes removed from trash',
              backgroundColor: AppColors.trashNotesColor));
    } else {
      CustomFlutterToast.showCustomFlutterToast(
          flutterToastModel: FlutterToastModel(
              message: 'All notes are empty',
              backgroundColor: AppColors.trashNotesColor));
    }
  }

  getNotes.getAllNotes();
  getNotes.getFavouriteNotes();
  getNotes.getHiddenNotes();
  getNotes.getTrashNotes();
}
