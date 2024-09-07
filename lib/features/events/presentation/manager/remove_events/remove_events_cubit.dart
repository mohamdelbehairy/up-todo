import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/notes/data/repos/remove_note/remove_note_repo.dart';

part 'remove_events_state.dart';

class RemoveEventsCubit extends Cubit<RemoveEventsState> {
  RemoveEventsCubit(this._removeNoteRepo) : super(RemoveEventsInitial());

  final RemoveNoteRepo _removeNoteRepo;

  Future<void> removeEvent({required int eventID}) async {
    await _removeNoteRepo.removeNote(
        noteID: eventID, boxName: Constants.kEvents);
    emit(RemoveEventsSuccess());
  }

  Future<void> removeAllEvents() async {
    await _removeNoteRepo.removeAllNotes(boxName: Constants.kEvents);
    emit(RemoveAllEventsSuccess());
  }
}
