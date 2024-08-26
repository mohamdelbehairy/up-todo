import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit() : super(GetNotesInitial());

  List<NoteModel> recentNotes = [
    NoteModel(
        title: 'Getting Started',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'UX Design',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Important',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Important',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
  ];
  List<NoteModel> allNotes = [
    NoteModel(
        title: 'Getting Started',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'UX Design',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Important',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Important',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Getting Started',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'UX Design',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Important',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Important',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
  ];
  List<NoteModel> favouriteNotes = [
    NoteModel(
        title: 'Getting Started',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'UX Design',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Important',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Important',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Getting Started',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'UX Design',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Important',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Important',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
  ];
  List<NoteModel> hiddenNotes = [
    NoteModel(
        title: 'Getting Started',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'UX Design',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Important',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Important',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Getting Started',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'UX Design',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Important',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Important',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
  ];
  List<NoteModel> trashNotes = [
    NoteModel(
        title: 'Getting Started',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'UX Design',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
    NoteModel(
        title: 'Important',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam cum ligula justo.Nisi, consectetur elementum.'),
  ];
}
