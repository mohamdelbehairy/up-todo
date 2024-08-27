part of 'get_notes_cubit.dart';

sealed class GetNotesState {}

final class GetNotesInitial extends GetNotesState {}

final class GetAllNotesSuccess extends GetNotesState {}

final class GetFavouriteNotesSuccess extends GetNotesState {}

final class GetHiddenNotesSuccess extends GetNotesState {}

final class GetTrashNotesSuccess extends GetNotesState {}