import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/models/flutter_toast_model.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/core/widgets/custom_flutter_toast.dart';
import '../../../data/models/note_model.dart';
import '../../manager/get_notes/get_notes_cubit.dart';
import '../../manager/remove_note/remove_note_cubit.dart';
import '../../manager/selected_type_note/selected_type_note_cubit.dart';
import '../../manager/store_note/store_note_cubit.dart';
import '../../manager/update_note/update_note_cubit.dart';

Future<void> onTapAllFavourite(BuildContext context) async {
  var selectedIndex = context.read<SelectedTypeNoteCubit>().selectedIndex;
  var getNotes = context.read<GetNotesCubit>();
  var removeAllNotes = context.read<RemoveNoteCubit>();
  var updateAllNotes = context.read<UpdateNoteCubit>();
  var storeNotes = context.read<StoreNoteCubit>();

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
              message: 'All notes are empty',
              backgroundColor: selectedIndex == 0
                  ? AppColors.allNotesColor
                  : AppColors.favouriteNotesColor));
    }
  }

  getNotes.getFavouriteNotes();
  getNotes.getAllNotes();
}
