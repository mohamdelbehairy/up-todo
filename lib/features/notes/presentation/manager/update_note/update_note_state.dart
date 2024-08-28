part of 'update_note_cubit.dart';

sealed class UpdateNoteState {}

final class UpdateNoteInitial extends UpdateNoteState {}

final class UpdateNoteLoading extends UpdateNoteState {}

final class UpdateNoteSuccess extends UpdateNoteState {}

final class UpdateNoteFailure extends UpdateNoteState {
  final String errorMessage;

  UpdateNoteFailure({required this.errorMessage});
}
