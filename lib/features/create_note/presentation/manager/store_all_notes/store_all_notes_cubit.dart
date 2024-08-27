import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/notes/data/repos/store_notes/store_notes_repo.dart';

import '../../../../notes/data/models/note_model.dart';

part 'store_all_notes_state.dart';

class StoreAllNotesCubit extends Cubit<StoreAllNotesState> {
  StoreAllNotesCubit(this._storeNotesRepo) : super(StoreAllNotesInitial());

  final StoreNotesRepo _storeNotesRepo;

  Future<void> storeAllNotes({required NoteModel noteModel}) async {
    emit(StoreAllNotesLoading());
    try {
      await _storeNotesRepo.storeAllNotes(noteModel: noteModel);
      emit(StoreAllNotesSuccess());
    } catch (e) {
      emit(StoreAllNotesFailure(errorMessage: e.toString()));
      log('error from storeAllNotes: $e');
    }
  }
}
