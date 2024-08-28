part of 'store_note_cubit.dart';

sealed class StoreNoteState {}

final class StoreNoteInitial extends StoreNoteState {}

final class StoreNoteLoading extends StoreNoteState {}

final class StoreNoteSuccess extends StoreNoteState {}

final class StoreNoteFailure extends StoreNoteState {
  final String errorMessage;

  StoreNoteFailure({required this.errorMessage});
}
