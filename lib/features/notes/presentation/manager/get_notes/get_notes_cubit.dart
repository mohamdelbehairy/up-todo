import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import 'package:up_todo/features/notes/data/repos/get_notes/get_notes_repo.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit(this._getNotesRepo) : super(GetNotesInitial());
  final GetNotesRepo _getNotesRepo;

  List<NoteModel> recentNotes = [];
  List<NoteModel> allNotes = [];
  List<NoteModel> favouriteNotes = [];
  List<NoteModel> hiddenNotes = [];
  List<NoteModel> trashNotes = [];

  void getAllNotes() {
    allNotes = _getNotesRepo.getNotes(Constants.kAllNotes);
    recentNotes = allNotes.isEmpty
        ? []
        : allNotes.length <= 4
            ? allNotes
            : allNotes.sublist(allNotes.length - 4);
    emit(GetAllNotesSuccess());
  }

  void getFavouriteNotes() {
    favouriteNotes = _getNotesRepo.getNotes(Constants.kFavouriteNotes);
    emit(GetFavouriteNotesSuccess());
  }

  void getHiddenNotes() {
    hiddenNotes = _getNotesRepo.getNotes(Constants.kHiddenNotes);
    emit(GetHiddenNotesSuccess());
  }

  void getTrashNotes() {
    trashNotes = _getNotesRepo.getNotes(Constants.kTrashNotes);
    emit(GetTrashNotesSuccess());
  }

  Map<dynamic, NoteModel> getNotesToMap(String boxName) {
    return _getNotesRepo.getNotesToMap(boxName);
  }
}
