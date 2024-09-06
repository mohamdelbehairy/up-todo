import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/models/flutter_toast_model.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/widgets/custom_flutter_toast.dart';

import '../../../../../core/utils/constants.dart';
import '../../../data/models/note_model.dart';
import '../../manager/get_notes/get_notes_cubit.dart';
import '../../manager/remove_note/remove_note_cubit.dart';
import '../../manager/selected_type_note/selected_type_note_cubit.dart';
import '../../manager/store_note/store_note_cubit.dart';

Future<void> onTapAllHidden(BuildContext context) async {
  var selectedIndex = context.read<SelectedTypeNoteCubit>().selectedIndex;
  var getNotes = context.read<GetNotesCubit>();
  var removeAllNotes = context.read<RemoveNoteCubit>();
  var storeNotes = context.read<StoreNoteCubit>();

  if (selectedIndex == 0) {
    if (getNotes.allNotes.isNotEmpty) {
      for (var elment in getNotes.allNotes) {
        if (elment.isFavourite) {
          await storeNotes.storeNote(
              noteModel: NoteModel(
                  title: elment.title,
                  body: elment.body,
                  isFavourite: true,
                  isHidden: true,
                  isTrash: elment.isTrash),
              boxName: Constants.kHiddenNotes);
          await removeAllNotes.removeAllNotes(
              boxName: Constants.kFavouriteNotes);
        } else {
          await storeNotes.storeNote(
              noteModel: NoteModel(
                  title: elment.title,
                  body: elment.body,
                  isFavourite: false,
                  isHidden: true,
                  isTrash: elment.isTrash),
              boxName: Constants.kHiddenNotes);
        }
        await removeAllNotes.removeAllNotes(boxName: Constants.kAllNotes);
      }
      CustomFlutterToast.showCustomFlutterToast(
          flutterToastModel: FlutterToastModel(
              message: 'All notes added to hidden',
              backgroundColor: AppColors.allNotesColor));
    } else {
      CustomFlutterToast.showCustomFlutterToast(
          flutterToastModel: FlutterToastModel(
              message: 'All notes are empty',
              backgroundColor: AppColors.allNotesColor));
    }
  } else {
    if (getNotes.hiddenNotes.isNotEmpty) {
      for (var elment in getNotes.hiddenNotes) {
        if (elment.isFavourite) {
          await storeNotes.storeNote(
              noteModel: NoteModel(
                  title: elment.title,
                  body: elment.body,
                  isFavourite: true,
                  isHidden: false,
                  isTrash: elment.isTrash),
              boxName: Constants.kFavouriteNotes);
          await storeNotes.storeNote(
              noteModel: NoteModel(
                  title: elment.title,
                  body: elment.body,
                  isFavourite: true,
                  isHidden: false,
                  isTrash: elment.isTrash),
              boxName: Constants.kAllNotes);
        } else {
          await storeNotes.storeNote(
              noteModel: NoteModel(
                  title: elment.title,
                  body: elment.body,
                  isFavourite: false,
                  isHidden: false,
                  isTrash: elment.isTrash),
              boxName: Constants.kAllNotes);
        }
        await removeAllNotes.removeAllNotes(boxName: Constants.kHiddenNotes);
      }
      CustomFlutterToast.showCustomFlutterToast(
          flutterToastModel: FlutterToastModel(
              message: 'All notes removed from hidden',
              backgroundColor: AppColors.hiddenNotesColor));
    } else {
      CustomFlutterToast.showCustomFlutterToast(
          flutterToastModel: FlutterToastModel(
              message: 'All notes are empty',
              backgroundColor: AppColors.hiddenNotesColor));
    }
  }
  getNotes.getFavouriteNotes();
  getNotes.getAllNotes();
  getNotes.getHiddenNotes();
}
