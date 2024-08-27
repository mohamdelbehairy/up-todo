import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/notes/data/repos/store_notes/store_notes_repo.dart';

import '../../../data/models/note_model.dart';

part 'store_types_note_state.dart';

class StoreTypesNoteCubit extends Cubit<StoreTypesNoteState> {
  StoreTypesNoteCubit(this._storeNotesRepo) : super(StoreTypesNoteInitial());

  final StoreNotesRepo _storeNotesRepo;

  Future<void> storeFavouriteNotes({required NoteModel noteModel}) async {
    emit(StoreTypesNoteLoading());
    try {
      await _storeNotesRepo.storeFavouriteNotes(noteModel: noteModel);
      emit(StoreFavouriteNoteSuccess());
    } catch (e) {
      emit(StoreTypesNoteFailure(errorMessage: e.toString()));
      log('error from storeFavouriteNotes: $e');
    }
  }

  Future<void> storeHiddenNotes({required NoteModel noteModel}) async {
    emit(StoreTypesNoteLoading());
    try {
      await _storeNotesRepo.storeHiddenNotes(noteModel: noteModel);
      emit(StoreHiddenNoteSuccess());
    } catch (e) {
      emit(StoreTypesNoteFailure(errorMessage: e.toString()));
      log('error from storeFavouriteNotes: $e');
    }
  }
}
