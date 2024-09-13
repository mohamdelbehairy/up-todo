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

  List<NoteModel> favoriteNotes = [];
  List<NoteModel> displayFavoriteNotes = [];

  List<NoteModel> hiddenNotes = [];
  List<NoteModel> displayHiddenNotes = [];

  List<NoteModel> trashNotes = [];
  List<NoteModel> displayTrashNotes = [];

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
    emit(SearchAllNotesSuccess());
  }

  void searchFavoriteNotes(String query) {
    favoriteNotes = _getNotesRepo.getNotes(Constants.kFavouriteNotes);

    if (query.isEmpty) {
      displayFavoriteNotes = [];
    } else {
      displayFavoriteNotes = favoriteNotes
          .where(
              (note) => note.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(SearchFavoriteNotesSuccess());
  }

  void searchHiddenNotes(String query) {
    hiddenNotes = _getNotesRepo.getNotes(Constants.kHiddenNotes);

    if (query.isEmpty) {
      displayHiddenNotes = [];
    } else {
      displayHiddenNotes = hiddenNotes
          .where(
              (note) => note.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(SearchHiddenNotesSuccess());
  }

  void searchTrashNotes(String query) {
    trashNotes = _getNotesRepo.getNotes(Constants.kTrashNotes);

    if (query.isEmpty) {
      displayTrashNotes = [];
    } else {
      displayTrashNotes = trashNotes
          .where(
              (note) => note.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(SearchTrashNotesSuccess());
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
