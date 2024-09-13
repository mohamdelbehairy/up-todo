import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/models/flutter_toast_model.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import '../../../../../core/widgets/custom_flutter_toast.dart';
import '../../../../search/presentation/manager/search/search_cubit.dart';
import '../../manager/get_notes/get_notes_cubit.dart';
import '../../manager/remove_note/remove_note_cubit.dart';
import '../../manager/store_note/store_note_cubit.dart';

Future<void> onTapHidden(
    BuildContext context, NoteModel noteModel, int index) async {
  var getNotes = context.read<GetNotesCubit>();
  var removeNote = context.read<RemoveNoteCubit>();
  var storeNote = context.read<StoreNoteCubit>();

  if (noteModel.isHidden) {
    context.read<SearchCubit>().searchHiddenNotes('');
    await storeNote.storeNote(
        noteModel: NoteModel(
            title: noteModel.title, body: noteModel.body, isHidden: false),
        boxName: Constants.kAllNotes);
    if (noteModel.isFavourite) {
      await storeNote.storeNote(
          noteModel: noteModel, boxName: Constants.kFavouriteNotes);
    }
    await removeNote.removeNote(noteID: index, boxName: Constants.kHiddenNotes);
    CustomFlutterToast.showCustomFlutterToast(
        flutterToastModel: FlutterToastModel(
            message: 'Note removed from hidden',
            backgroundColor: AppColors.hiddenNotesColor));
  } else {
    context.read<SearchCubit>().searchAllNotes('');
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
    CustomFlutterToast.showCustomFlutterToast(
        flutterToastModel: FlutterToastModel(
            message: 'Note added to hidden',
            backgroundColor: AppColors.allNotesColor));
  }
  getNotes.getFavouriteNotes();
  getNotes.getHiddenNotes();
  getNotes.getAllNotes();
}
