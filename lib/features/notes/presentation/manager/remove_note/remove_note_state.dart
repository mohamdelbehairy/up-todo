part of 'remove_note_cubit.dart';

sealed class RemoveNoteState {}

final class RemoveNoteInitial extends RemoveNoteState {}

final class RemoveNoteLoading extends RemoveNoteState {}


final class RemoveNoteSuccess extends RemoveNoteState {}

final class RemoveNoteFailure extends RemoveNoteState {
  final String errorMessage;
  RemoveNoteFailure({required this.errorMessage});
}