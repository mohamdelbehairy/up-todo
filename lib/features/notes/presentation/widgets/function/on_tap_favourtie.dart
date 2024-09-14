import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/core/widgets/custom_flutter_toast.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import 'package:up_todo/features/notes/presentation/manager/get_notes/get_notes_cubit.dart';
import 'package:up_todo/features/notes/presentation/manager/remove_note/remove_note_cubit.dart';
import 'package:up_todo/features/notes/presentation/manager/store_note/store_note_cubit.dart';
import 'package:up_todo/features/search/presentation/manager/search/search_cubit.dart';

import '../../../../../core/models/flutter_toast_model.dart';
import '../../manager/selected_type_note/selected_type_note_cubit.dart';

Future<void> onTapFavourite(
    BuildContext context, NoteModel noteModel, int index) async {
  var selectedIndex = context.read<SelectedTypeNoteCubit>().selectedIndex;

  var getNotes = context.read<GetNotesCubit>();
  var removeNote = context.read<RemoveNoteCubit>();
  var storeNote = context.read<StoreNoteCubit>();

  if (noteModel.isFavourite) {
    context.read<SearchCubit>().searchFavoriteNotes('');
    await storeNote.storeNote(
        noteModel: NoteModel(title: noteModel.title, body: noteModel.body),
        boxName: Constants.kAllNotes);
    await removeNote.removeNote(
        noteID: index, boxName: Constants.kFavouriteNotes);
    CustomFlutterToast.showCustomFlutterToast(
        flutterToastModel: FlutterToastModel(
            message: 'Note removed from favourite',
            backgroundColor: selectedIndex == 0
                ? AppColors.allNotesColor
                : AppColors.favouriteNotesColor));
  } else {
    await storeNote.storeNote(
        noteModel: NoteModel(
            title: noteModel.title, body: noteModel.body, isFavourite: true),
        boxName: Constants.kFavouriteNotes);
    await removeNote.removeNote(noteID: index, boxName: Constants.kAllNotes);

    CustomFlutterToast.showCustomFlutterToast(
        flutterToastModel: FlutterToastModel(
            message: 'Note added to favourite',
            backgroundColor: AppColors.allNotesColor));
  }

  getNotes.getAllNotes();
  getNotes.getFavouriteNotes();
}
