import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/models/flutter_toast_model.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/core/widgets/custom_flutter_toast.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';

import '../../../../search/presentation/manager/search/search_cubit.dart';
import '../../manager/get_notes/get_notes_cubit.dart';
import '../../manager/remove_note/remove_note_cubit.dart';
import '../../manager/selected_type_note/selected_type_note_cubit.dart';
import '../../manager/store_note/store_note_cubit.dart';

Future<void> onTapTrash(
    BuildContext context, NoteModel noteModel, int index) async {
  var selectedIndex = context.read<SelectedTypeNoteCubit>().selectedIndex;
  var getNotes = context.read<GetNotesCubit>();
  var removeNote = context.read<RemoveNoteCubit>();
  var storeNote = context.read<StoreNoteCubit>();

  if (noteModel.isTrash) {
    context.read<SearchCubit>().searchTrashNotes('');
    await storeNote.storeNote(
        noteModel: NoteModel(
            title: noteModel.title, body: noteModel.body, isTrash: false),
        boxName: Constants.kAllNotes);
    await removeNote.removeNote(noteID: index, boxName: Constants.kTrashNotes);
    CustomFlutterToast.showCustomFlutterToast(
        flutterToastModel: FlutterToastModel(
            message: 'Note removed from trash',
            backgroundColor: AppColors.trashNotesColor));
  } else {
    context.read<SearchCubit>().searchAllNotes('');
    context.read<SearchCubit>().searchHiddenNotes('');
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
    if (selectedIndex <= 0) {
      await removeNote.removeNote(noteID: index, boxName: Constants.kAllNotes);
    }
    CustomFlutterToast.showCustomFlutterToast(
        flutterToastModel: FlutterToastModel(
            message: 'Note added to trash',
            backgroundColor: selectedIndex == 0
                ? AppColors.allNotesColor
                : selectedIndex == 1
                    ? AppColors.favouriteNotesColor
                    : AppColors.hiddenNotesColor));
  }
  getNotes.getFavouriteNotes();
  getNotes.getHiddenNotes();
  getNotes.getTrashNotes();
  getNotes.getAllNotes();
}
