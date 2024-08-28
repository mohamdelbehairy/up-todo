import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/notes/data/repos/store_notes/store_notes_repo.dart';

import '../../../data/models/note_model.dart';

part 'store_note_state.dart';

class StoreNoteCubit extends Cubit<StoreNoteState> {
  StoreNoteCubit(this._storeNotesRepo) : super(StoreNoteInitial());

  final StoreNotesRepo _storeNotesRepo;

  Future<void> storeNote(
      {required NoteModel noteModel, required String boxName}) async {
    emit(StoreNoteLoading());
    try {
      await _storeNotesRepo.storeNotes(noteModel: noteModel, boxName: boxName);
      emit(StoreNoteSuccess());
    } catch (e) {
      emit(StoreNoteFailure(errorMessage: e.toString()));
      log('error from storeNote: $e');
    }
  }
}
