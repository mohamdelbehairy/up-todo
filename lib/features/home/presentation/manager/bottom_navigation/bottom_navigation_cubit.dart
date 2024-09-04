import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/features/notes/presentation/views/notes_view.dart';
import 'package:up_todo/features/search/presentation/views/search_view.dart';

import '../../../../events/presentation/views/events_view.dart';
import '../../../data/models/bottom_navigation_model.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInitial());

  List<BottomNavigationModel> bottomNavigationList = [
    BottomNavigationModel(image: Assets.imagesNotes, index: 0, label: 'Notes'),
    BottomNavigationModel(image: Assets.imagesEvent, index: 1, label: 'Event'),
    BottomNavigationModel(
        image: Assets.imagesSearch, index: 2, label: 'Search'),
    BottomNavigationModel(
        image: Assets.imagesCreateNote, index: 3, label: 'Create Note'),
  ];

  List views = [
    const NotesView(),
    const EventsView(),
    const SearchView(),
    const Scaffold(backgroundColor: Colors.black),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavigationChanged());
  }
}
