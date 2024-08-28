import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/notes/data/repos/update_notes/update_note_repo.dart';

import '../../../data/models/note_model.dart';

part 'update_note_state.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteState> {
  UpdateNoteCubit(this._updateNoteRepo) : super(UpdateNoteInitial());

  final UpdateNoteRepo _updateNoteRepo;

  Future<void> updateNotes(
      {required int index,
      required String boxName,
      required NoteModel noteModel}) async {
    emit(UpdateNoteLoading());
    try {
      await _updateNoteRepo.updateNotes(
          index: index, boxName: boxName, noteModel: noteModel);
      emit(UpdateNoteSuccess());
    } catch (e) {
      emit(UpdateNoteFailure(errorMessage: e.toString()));
      log('error from updateNote: $e');
    }
  }
}
