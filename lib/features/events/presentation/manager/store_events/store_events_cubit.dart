import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/notes/data/repos/store_note/store_note_repo.dart';

import '../../../../notes/data/models/note_model.dart';

part 'store_events_state.dart';

class StoreEventsCubit extends Cubit<StoreEventsState> {
  StoreEventsCubit(this._storeNoteRepo) : super(StoreEventsInitial());

  final StoreNoteRepo _storeNoteRepo;
  Future<void> storeEvents({required NoteModel noteModel}) async {
    emit(StoreEventsLoading());
    try {
      await _storeNoteRepo.storeNotes(
          noteModel: noteModel, boxName: Constants.kEvents);
      emit(StoreEventsSuccess());
    } catch (e) {
      emit(StoreEventsFailure(errorMessage: e.toString()));
      log('error from storeEvents: $e');
    }
  }
}
