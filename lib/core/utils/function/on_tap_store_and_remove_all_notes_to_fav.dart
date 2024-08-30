import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/models/flutter_toast_model.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/core/widgets/custom_flutter_toast.dart';

import '../../../features/notes/data/models/note_model.dart';
import '../../../features/notes/presentation/manager/get_notes/get_notes_cubit.dart';
import '../../../features/notes/presentation/manager/remove_note/remove_note_cubit.dart';
import '../../../features/notes/presentation/manager/selected_type_note/selected_type_note_cubit.dart';
import '../../../features/notes/presentation/manager/store_note/store_note_cubit.dart';
import '../../../features/notes/presentation/manager/update_note/update_note_cubit.dart';

Future<void> onTapStoreAndRemoveAllNotesToFav(BuildContext context) async {
  var selectedIndex = context.read<SelectedTypeNoteCubit>().selectedIndex;
  var getNotes = context.read<GetNotesCubit>();
  var removeAllNotes = context.read<RemoveNoteCubit>();
  var updateAllNotes = context.read<UpdateNoteCubit>();
  var storeNotes = context.read<StoreNoteCubit>();

  GoRouter.of(context).pop();
  if (selectedIndex == 0 && getNotes.allNotes.isNotEmpty) {
    for (var key in getNotes.getNotesToMap(Constants.kAllNotes).keys) {
      var note = getNotes.getNotesToMap(Constants.kAllNotes)[key] as NoteModel;
      if (!note.isFavourite) {
        await updateAllNotes.updateNotesWithKey(
            key: key,
            boxName: Constants.kAllNotes,
            noteModel: NoteModel(
                title: note.title,
                body: note.body,
                isFavourite: true,
                isHidden: note.isHidden,
                isTrash: note.isTrash));
        await storeNotes.storeNote(
            noteModel: NoteModel(
                title: note.title,
                body: note.body,
                isFavourite: true,
                isHidden: note.isHidden,
                isTrash: note.isTrash),
            boxName: Constants.kFavouriteNotes);
        CustomFlutterToast.showCustomFlutterToast(
            flutterToastModel: FlutterToastModel(
                message: 'All notes added to favourite',
                backgroundColor: AppColors.allNotesColor));
      } else {
        CustomFlutterToast.showCustomFlutterToast(
            flutterToastModel: FlutterToastModel(
                message: 'All notes are already in favourite',
                backgroundColor: AppColors.allNotesColor));
      }
    }
  } else {
    if (getNotes.favouriteNotes.isNotEmpty) {
      for (var key in getNotes.getNotesToMap(Constants.kAllNotes).keys) {
        var note =
            getNotes.getNotesToMap(Constants.kAllNotes)[key] as NoteModel;
        await updateAllNotes.updateNotesWithKey(
            key: key,
            boxName: Constants.kAllNotes,
            noteModel: NoteModel(
                title: note.title,
                body: note.body,
                isFavourite: false,
                isHidden: note.isHidden,
                isTrash: note.isTrash));
      }
      await removeAllNotes.removeAllNotes(boxName: Constants.kFavouriteNotes);
      CustomFlutterToast.showCustomFlutterToast(
          flutterToastModel: FlutterToastModel(
              message: 'All notes removed from favourite',
              backgroundColor: AppColors.favouriteNotesColor));
    } else {
      CustomFlutterToast.showCustomFlutterToast(
          flutterToastModel: FlutterToastModel(
              message: 'You don\'t have any notes in favourite',
              backgroundColor: AppColors.favouriteNotesColor));
    }
  }

  getNotes.getFavouriteNotes();
  getNotes.getAllNotes();
}
