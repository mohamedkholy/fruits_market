import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> _notificationBackgroundHandler(RemoteMessage message) async {
  debugPrint(
    "New Message: title: ${message.notification?.title}, body: ${message.notification?.body}",
  );
}

class NotificationsManager {
  factory NotificationsManager() => _instance;
  static final NotificationsManager _instance = NotificationsManager._();
  NotificationsManager._();

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  final AndroidNotificationChannel _androidNotificationChannel =
      const AndroidNotificationChannel(
        'high_importance_channel',
        'High Importance Notifications',
        description: 'This channel is used for important notifications.',
        importance: Importance.high,
      );

  Future<void> requestPermission() async {
    await FirebaseMessaging.instance.requestPermission();
  }

  Future<void> initNotifications() async {
    await _initializeLocalNotifications();
    await _createNotificationChannel();
    _initNotificationHandlers();
  }

  void _initNotificationHandlers() {
    FirebaseMessaging.onMessage.listen(_showNotifications);
    FirebaseMessaging.onBackgroundMessage(_notificationBackgroundHandler);
  }

  Future<void> _initializeLocalNotifications() async {
    await _localNotifications.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('ic_notification_icon'),
      ),
    );
  }

  Future<void> _createNotificationChannel() async {
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_androidNotificationChannel);
  }

  Future<void> _showNotifications(RemoteMessage message) async {
    debugPrint(
      "New Message: title: ${message.notification?.title}, body: ${message.notification?.body}",
    );
    final notification = message.notification;
    if (notification != null) {
      final androidDetails = AndroidNotificationDetails(
        _androidNotificationChannel.id,
        _androidNotificationChannel.name,
        channelDescription: _androidNotificationChannel.description,
        importance: _androidNotificationChannel.importance,
        priority: Priority.high,
      );

      final platformDetails = NotificationDetails(android: androidDetails);
      await _localNotifications.show(
        notification.hashCode,
        notification.title!,
        notification.body!,
        platformDetails,
      );
    }
  }
}
