import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../notes/data/models/note_model.dart';
import '../../../../notes/data/repos/get_notes/get_notes_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._getNotesRepo) : super(SearchInitial());
  final GetNotesRepo _getNotesRepo;

  List<NoteModel> notes = [];
  List<NoteModel> displayNotes = [];


  void searchNotes(String query) {
    notes = _getNotesRepo.getNotes(Constants.kAllNotes);

    if (query.isEmpty) {
      displayNotes = [];
    } else {
      displayNotes = notes
          .where(
              (note) => note.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(SearchEventsSuccess());
  }

  int gridViewAvtiveIndex = -1;
  void gradeViewChangeIndex(int index) {
    gridViewAvtiveIndex = index;
    emit(ChangeIndex());
  }

  int listViewAvtiveIndex = -1;
  void listViewChangeIndex(int index) {
    listViewAvtiveIndex = index;
    emit(ChangeIndex());
  }
}
