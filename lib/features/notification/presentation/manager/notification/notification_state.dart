part of 'notification_cubit.dart';

sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class InitNotificationSuccess extends NotificationState {}

final class ShowNotificationSuccess extends NotificationState {}
