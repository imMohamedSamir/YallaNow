import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/NotificationView/presentation/NotificationView.dart';
import 'package:yallanow/Features/UserPart/NotificationView/presentation/views/NotificationItem.dart';

class NotificationsCard extends StatelessWidget {
  final List<NotificationDetailsModel> notifications;

  const NotificationsCard({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: notifications
            .map((notification) => NotificationItem(notification: notification))
            .toList(),
      ),
    );
  }
}
