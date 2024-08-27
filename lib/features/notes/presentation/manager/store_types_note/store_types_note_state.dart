part of 'store_types_note_cubit.dart';

sealed class StoreTypesNoteState {}

final class StoreTypesNoteInitial extends StoreTypesNoteState {}

final class StoreTypesNoteLoading extends StoreTypesNoteState {}

final class StoreFavouriteNoteSuccess extends StoreTypesNoteState {}

final class StoreHiddenNoteSuccess extends StoreTypesNoteState {}

final class StoreTrashNoteSuccess extends StoreTypesNoteState {}

final class StoreTypesNoteFailure extends StoreTypesNoteState {
  final String errorMessage;

  StoreTypesNoteFailure({required this.errorMessage});
}
