part of 'selected_type_note_cubit.dart';

sealed class SelectedTypeNoteState {}

final class SelectedTypeNoteInitial extends SelectedTypeNoteState {}

final class SelectedTypeNoteChanged extends SelectedTypeNoteState {}

final class ChangeIndex extends SelectedTypeNoteState {}
