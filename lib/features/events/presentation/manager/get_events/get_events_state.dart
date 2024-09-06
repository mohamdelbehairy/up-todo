part of 'get_events_cubit.dart';

sealed class GetEventsState {}

final class GetEventsInitial extends GetEventsState {}

final class GetEventsSuccess extends GetEventsState {}

final class ChangeIndex extends GetEventsState {}
