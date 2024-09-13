import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import '../models/notification_model.dart';
import 'notification_repo.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationRepoImpl extends NotificationRepo {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void onTap(NotificationResponse details) {}

  @override
  Future<void> initNotification() async {
    InitializationSettings initializationSettings =
        const InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"),
            iOS: DarwinInitializationSettings());
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onTap,
        onDidReceiveBackgroundNotificationResponse: onTap);
  }

  @override
  Future<void> checkNotificationPermission() async {
    var isPermisions = await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.areNotificationsEnabled();

    if (isPermisions == null || !isPermisions) {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }
  }

  @override
  Future<void> showNotification(
      {required NotificationModel notificationModel}) async {
    tz.initializeTimeZones();

    AndroidNotificationDetails android = AndroidNotificationDetails(
        "UpTodo", "UpTodo",
        importance: Importance.max,
        priority: Priority.high,
        sound:
            RawResourceAndroidNotificationSound('sound.wav'.split('.').first));

    NotificationDetails notificationDetails = NotificationDetails(
        android: android, iOS: const DarwinNotificationDetails());

    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();

    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        notificationModel.id,
        notificationModel.title,
        notificationModel.body,
        tz.TZDateTime(
            tz.local,
            notificationModel.dateTime.year,
            notificationModel.dateTime.month,
            notificationModel.dateTime.day,
            notificationModel.dateTime.hour,
            notificationModel.dateTime.minute),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  @override
  Future<void> cancelNotification({required int id}) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  @override
  Future<void> cancelAllNotification() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
