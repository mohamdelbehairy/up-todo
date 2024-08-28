import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/notes/data/repos/remove_note/remove_note_repo.dart';

part 'remove_note_state.dart';

class RemoveNoteCubit extends Cubit<RemoveNoteState> {
  RemoveNoteCubit(this._removeNotesRepo) : super(RemoveNoteInitial());

  final RemoveNoteRepo _removeNotesRepo;

  Future<void> removeNote(
      {required int noteID, required String boxName}) async {
    emit(RemoveNoteLoading());
    try {
      await _removeNotesRepo.removeNote(noteID: noteID, boxName: boxName);
      emit(RemoveNoteSuccess());
    } catch (e) {
      emit(RemoveNoteFailure(errorMessage: e.toString()));
      log('error from removeNote: $e');
    }
  }
}
