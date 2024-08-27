part of 'remove_notes_cubit.dart';

sealed class RemoveNotesState {}

final class RemoveNotesInitial extends RemoveNotesState {}

final class RemoveNotesLoading extends RemoveNotesState {}

final class RemoveFavouriteNotesSuccess extends RemoveNotesState {}

final class RemoveAllNotesSuccess extends RemoveNotesState {}

final class RemoveHiddenNotesSuccess extends RemoveNotesState {}

final class RemoveTrashNotesSuccess extends RemoveNotesState {}