part of 'search_result_cubit.dart';

sealed class SearchResultState {}

final class SearchResultInitial extends SearchResultState {}

final class SearchResultSuccess extends SearchResultState {}

final class RemoveAllSearchResult extends SearchResultState {}


final class RemoveSearchResult extends SearchResultState {}


final class ChangeGridViewActiveIndex extends SearchResultState {}
