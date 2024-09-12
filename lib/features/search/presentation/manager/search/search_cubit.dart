import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../notes/data/models/note_model.dart';
import '../../../../notes/data/repos/get_notes/get_notes_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._getNotesRepo) : super(SearchInitial());
  final GetNotesRepo _getNotesRepo;

  List<NoteModel> allNotes = [];
  List<NoteModel> displayAllNotes = [];


  void searchAllNotes(String query) {
    allNotes = _getNotesRepo.getNotes(Constants.kAllNotes);

    if (query.isEmpty) {
      displayAllNotes = [];
    } else {
      displayAllNotes = allNotes
          .where(
              (note) => note.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(SearchALlNotesSuccess());
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
