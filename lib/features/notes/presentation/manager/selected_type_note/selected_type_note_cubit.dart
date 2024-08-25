import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/features/notes/data/models/selected_type_note_model.dart';

part 'selected_type_note_state.dart';

class SelectedTypeNoteCubit extends Cubit<SelectedTypeNoteState> {
  SelectedTypeNoteCubit() : super(SelectedTypeNoteInitial());

  List<SelectedTypeNoteModel> selectedTypeNoteList = [
    SelectedTypeNoteModel(
        index: 0,
        name: 'All Notes',
        image: Assets.imagesAllNotes,
        backgroundColor: const Color(0xff8E8E92)),
    SelectedTypeNoteModel(
        index: 1,
        name: 'Favourites',
        image: Assets.imagesFavourite,
        backgroundColor: const Color(0xffF7CE45)),
    SelectedTypeNoteModel(
        index: 2,
        name: 'Hidden',
        image: Assets.imagesHidden,
        backgroundColor: const Color(0xff4E94F8)),
    SelectedTypeNoteModel(
        index: 3,
        name: 'Trash',
        image: Assets.imagesTrash,
        backgroundColor: const Color(0xffEB4D3D)),
  ];

  int selectedIndex = -1;
  void changeSelectedTypeNote(int index) {
    selectedIndex = index;
    emit(SelectedTypeNoteChanged());
  }
}
