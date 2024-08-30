import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/notes/data/repos/update_notes/update_note_repo.dart';

import '../../../data/models/note_model.dart';

part 'update_note_state.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteState> {
  UpdateNoteCubit(this._updateNoteRepo) : super(UpdateNoteInitial());

  final UpdateNoteRepo _updateNoteRepo;

  Future<void> updateNotesWithIndex(
      {required int index,
      required String boxName,
      required NoteModel noteModel}) async {
    emit(UpdateNoteLoading());
    try {
      await _updateNoteRepo.updateNotesWithIndex(
          index: index, boxName: boxName, noteModel: noteModel);
      emit(UpdateNoteWithIndexSuccess());
    } catch (e) {
      emit(UpdateNoteFailure(errorMessage: e.toString()));
      log('error from updateNoteWithIndex : $e');
    }
  }

  Future<void> updateNotesWithKey(
      {required key,
      required String boxName,
      required NoteModel noteModel}) async {
    emit(UpdateNoteLoading());
    try {
      await _updateNoteRepo.updateNotesWithKey(
          key: key, boxName: boxName, noteModel: noteModel);
      emit(UpdateNoteWithKeySuccess());
    } catch (e) {
      emit(UpdateNoteFailure(errorMessage: e.toString()));
      log('error from updateNoteWithKey: $e');
    }
  }
}
