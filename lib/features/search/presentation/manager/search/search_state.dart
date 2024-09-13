part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchAllNotesSuccess extends SearchState {}

final class SearchFavoriteNotesSuccess extends SearchState {}

final class SearchHiddenNotesSuccess extends SearchState {}

final class SearchTrashNotesSuccess extends SearchState {}

final class ChangeIndex extends SearchState {}
