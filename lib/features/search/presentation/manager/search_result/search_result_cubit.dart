import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import 'package:up_todo/features/notes/data/repos/remove_note/remove_note_repo.dart';

import '../../../../notes/data/repos/get_notes/get_notes_repo.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit(this._getNotesRepo, this._removeNoteRepo)
      : super(SearchResultInitial());
  final GetNotesRepo _getNotesRepo;
  final RemoveNoteRepo _removeNoteRepo;

  List<NoteModel> allNotes = [];
  List<NoteModel> recentSearch = [];
  void getRecentSearche() async {
    allNotes = _getNotesRepo.getNotes(Constants.kRecentSearch);
    recentSearch = allNotes.isEmpty
        ? []
        : allNotes.length <= 4
            ? allNotes
            : allNotes.sublist(allNotes.length - 4);
    emit(SearchResultSuccess());
  }

  Future<void> removeAllRecentSearch() async {
    await _removeNoteRepo.removeAllNotes(boxName: Constants.kRecentSearch);
    getRecentSearche();
    emit(RemoveAllSearchResult());
  }

  Future<void> removeRecentSearch({required int index}) async {
    await _removeNoteRepo.removeNote(
        noteID: index, boxName: Constants.kRecentSearch);
    getRecentSearche();
    emit(RemoveSearchResult());
  }

  int activeIndex = -1;
  void changeGridViewActiveIndex(int index) {
    activeIndex = index;
    emit(ChangeGridViewActiveIndex());
  }
}
