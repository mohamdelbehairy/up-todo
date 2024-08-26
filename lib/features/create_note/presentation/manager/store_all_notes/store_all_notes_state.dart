part of 'store_all_notes_cubit.dart';

sealed class StoreAllNotesState {}

final class StoreAllNotesInitial extends StoreAllNotesState {}

final class StoreAllNotesLoading extends StoreAllNotesState {}

final class StoreAllNotesSuccess extends StoreAllNotesState {}

final class StoreAllNotesFailure extends StoreAllNotesState {

  final String errorMessage;

  StoreAllNotesFailure( {required this.errorMessage});
}
