import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationService {
  static final _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static init() {
    _notificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
    );
    tz.initializeTimeZones();
  }

  static scheduleNotification(
    String title,
    String body,
  ) async {
    var iosDetails = const DarwinNotificationDetails();
    var androidDetails = const AndroidNotificationDetails(
      'important_notifications',
      'My Channel',
      importance: Importance.max,
      priority: Priority.high,
    );
    var notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );
    await _notificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(
        const Duration(seconds: 5),
      ),
      // tz.TZDateTime.from(
      //         DateTime(2024, 05, 28, 16, 00, 00).subtract(
      //           const Duration(minutes: 10),
      //         ),
      //         tz.local)
      //     .add(
      //   const Duration(seconds: 5),
      // ),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}
