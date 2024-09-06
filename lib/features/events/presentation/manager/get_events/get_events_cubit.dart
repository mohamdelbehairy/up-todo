import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import 'package:up_todo/features/notes/data/repos/get_notes/get_notes_repo.dart';

part 'get_events_state.dart';

class GetEventsCubit extends Cubit<GetEventsState> {
  GetEventsCubit(this._getNotesRepo) : super(GetEventsInitial());
  final GetNotesRepo _getNotesRepo;

  List<NoteModel> events = [];

  int acvtiveIndex = -1;
  void getEvents() {
    events = _getNotesRepo.getNotes(Constants.kEvents);
    emit(GetEventsSuccess());
  }

  void listViewChangeIndex(int index) {
    acvtiveIndex = index;
    emit(ChangeIndex());
  }
}
