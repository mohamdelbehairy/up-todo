part of 'store_events_cubit.dart';

sealed class StoreEventsState {}

final class StoreEventsInitial extends StoreEventsState {}

final class StoreEventsLoading extends StoreEventsState {}

final class StoreEventsSuccess extends StoreEventsState {}

final class StoreEventsFailure extends StoreEventsState {
  final String errorMessage;

  StoreEventsFailure({required this.errorMessage});
}
