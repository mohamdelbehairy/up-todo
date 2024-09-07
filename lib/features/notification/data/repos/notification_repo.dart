import '../models/notification_model.dart';

abstract class NotificationRepo {

  Future<void> initNotification();
  Future<void> checkNotificationPermission();
  Future<void> showNotification({required NotificationModel notificationModel});
  Future<void> cancelNotification({required int id});
  Future<void> cancelAllNotification();
}