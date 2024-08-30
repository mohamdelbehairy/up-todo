import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/features/notes/data/models/selected_type_note_model.dart';

part 'selected_type_note_state.dart';

class SelectedTypeNoteCubit extends Cubit<SelectedTypeNoteState> {
  SelectedTypeNoteCubit() : super(SelectedTypeNoteInitial());

  List<SelectedTypeNoteModel> selectedTypeNoteList = [
    SelectedTypeNoteModel(
        index: 0,
        name: 'All Notes',
        image: Assets.imagesAllNotes,
        backgroundColor: AppColors.allNotesColor),
    SelectedTypeNoteModel(
        index: 1,
        name: 'Favourites',
        image: Assets.imagesFavourite,
        backgroundColor: AppColors.favouriteNotesColor),
    SelectedTypeNoteModel(
        index: 2,
        name: 'Hidden',
        image: Assets.imagesHidden,
        backgroundColor: AppColors.hiddenNotesColor),
    SelectedTypeNoteModel(
        index: 3,
        name: 'Trash',
        image: Assets.imagesTrash,
        backgroundColor: AppColors.trashNotesColor),
  ];

  int selectedIndex = -1;
  void changeSelectedTypeNote(int index) {
    selectedIndex = index;
    emit(SelectedTypeNoteChanged());
  }

  int gridViewAvtiveIndex = -1;
  void gradeViewChangeIndex(int index) {
    gridViewAvtiveIndex = index;
    emit(ChangeIndex());
  }

  int listViewAvtiveIndex = -1;
  void listViewChangeIndex(int index) {
    listViewAvtiveIndex = index;
    emit(ChangeIndex());
  }
}
