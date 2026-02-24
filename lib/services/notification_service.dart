import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    if (kIsWeb) return; // web scheduling not supported here

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: iOS);
    await _plugin.initialize(settings);
  }

  Future<void> scheduleNotification(
      int id, String title, String body, DateTime dt) async {
    if (kIsWeb) return;
    if (dt.isBefore(DateTime.now())) return;
    // Scheduling platform notifications reliably requires timezone setup
    // and platform-specific configuration. For simplicity this is a noop
    // placeholder that can be extended to call `zonedSchedule` with proper
    // timezone initialization on mobile platforms.
    debugPrint('scheduleNotification: id=$id title=$title at $dt');
  }
}

// Note: this file requires the `timezone` package and proper initialization
// to work correctly. For simplicity, scheduling will be no-op on web and
// will need additional setup (tz.initializeTimeZones()) for mobile.
