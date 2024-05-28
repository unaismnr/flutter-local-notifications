import 'package:flutter/material.dart';
import 'package:local_noti/notification_service.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Notifications'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.notification_add),
              label: const Text('Show Notification'),
            ),
            TextButton.icon(
              onPressed: () {
                NotificationService.scheduleNotification(
                  'Notification',
                  'Schedule Notifications',
                );
              },
              icon: const Icon(Icons.schedule),
              label: const Text('Schedule Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
