import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/notes/data/repos/remove_notes/remove_notes_repo.dart';

part 'remove_notes_state.dart';

class RemoveNotesCubit extends Cubit<RemoveNotesState> {
  RemoveNotesCubit(this._removeNotesRepo) : super(RemoveNotesInitial());

  final RemoveNotesRepo _removeNotesRepo;

  Future<void> removeFavouriteNotes({required int noteID}) async {
    await _removeNotesRepo.removeFavouriteNotes(noteID: noteID);
    emit(RemoveFavouriteNotesSuccess());
  }

   Future<void> removeAllNotes({required int noteID}) async {
    await _removeNotesRepo.removeAllNotes(noteID: noteID);
    emit(RemoveAllNotesSuccess());
  }

  Future<void> removeHiddenNotes({required int noteID}) async {
    await _removeNotesRepo.removeHiddenNotes(noteID: noteID);
    emit(RemoveHiddenNotesSuccess());
  }
}
