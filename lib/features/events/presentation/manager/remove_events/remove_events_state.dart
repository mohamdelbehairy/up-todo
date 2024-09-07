part of 'remove_events_cubit.dart';

sealed class RemoveEventsState {}

final class RemoveEventsInitial extends RemoveEventsState {}

final class RemoveEventsSuccess extends RemoveEventsState {}

final class RemoveAllEventsSuccess extends RemoveEventsState {}