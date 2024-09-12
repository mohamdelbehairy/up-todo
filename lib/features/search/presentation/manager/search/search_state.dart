part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchALlNotesSuccess extends SearchState {}

final class ChangeIndex extends SearchState {}
