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

Future<void> onTapAllFavourite(BuildContext context) async {
  var selectedIndex = context.read<SelectedTypeNoteCubit>().selectedIndex;
  var getNotes = context.read<GetNotesCubit>();
  var removeAllNotes = context.read<RemoveNoteCubit>();
  var storeNotes = context.read<StoreNoteCubit>();

  if (selectedIndex == 0) {
    if (getNotes.allNotes.isNotEmpty) {
      for (var element in getNotes.allNotes) {
        if (!element.isFavourite) {
          await storeNotes.storeNote(
              noteModel: NoteModel(
                  title: element.title, body: element.body, isFavourite: true),
              boxName: Constants.kFavouriteNotes);
          await removeAllNotes.removeAllNotes(boxName: Constants.kAllNotes);
          CustomFlutterToast.showCustomFlutterToast(
              flutterToastModel: FlutterToastModel(
                  message: 'All notes added to favourite',
                  backgroundColor: AppColors.allNotesColor));
        }
      }
    } else {
      CustomFlutterToast.showCustomFlutterToast(
          flutterToastModel: FlutterToastModel(
              message: 'All notes are empty',
              backgroundColor: AppColors.allNotesColor));
    }
  } else {
    if (getNotes.favouriteNotes.isNotEmpty) {
      for (var element in getNotes.favouriteNotes) {
        await storeNotes.storeNote(
            noteModel: NoteModel(title: element.title, body: element.body),
            boxName: Constants.kAllNotes);
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
