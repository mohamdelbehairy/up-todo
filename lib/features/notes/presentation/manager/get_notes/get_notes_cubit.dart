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
    emit(GetAllNotesSuccess());
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
