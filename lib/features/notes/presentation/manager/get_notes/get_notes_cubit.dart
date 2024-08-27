import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import 'package:up_todo/features/notes/data/repos/get_notes_repo.dart';

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
    allNotes = _getNotesRepo.getAllNotes();
    recentNotes = allNotes.isEmpty
        ? []
        : allNotes.length <= 4
            ? allNotes
            : allNotes.sublist(allNotes.length - 4);
    emit(GetAllNotesSuccess());
  }

  void getFavouriteNotes() {
    favouriteNotes = _getNotesRepo.getFavouriteNotes();
    emit(GetFavouriteNotesSuccess());
  }
}
