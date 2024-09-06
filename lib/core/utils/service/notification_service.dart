import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../../features/events/data/models/notification_model.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void onTap(NotificationResponse details) {}

  Future<void> initNotification() async {
    InitializationSettings initializationSettings =
        const InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"),
            iOS: DarwinInitializationSettings());
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onTap,
        onDidReceiveBackgroundNotificationResponse: onTap);
  }

  Future<void> checkNotificationPermission() async {
    var isPermisions = await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.areNotificationsEnabled();

    if (isPermisions == null || !isPermisions) {
      await requestNotificationPermission();
    }
  }

  Future<void> requestNotificationPermission() async {
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

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
}
