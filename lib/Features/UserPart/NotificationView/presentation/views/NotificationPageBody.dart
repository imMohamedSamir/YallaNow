import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/NotificationView/presentation/NotificationView.dart';
import 'package:yallanow/Features/UserPart/NotificationView/presentation/views/NotificationsCard.dart';

class NotificationPageBody extends StatelessWidget {
  const NotificationPageBody({super.key});
  static final List<NotificationDetailsModel> notificationDetails = [
    NotificationDetailsModel(
      day: "today",
      title: "Payment Successfully!",
      subtitle:
          "Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae",
    ),
    NotificationDetailsModel(
      day: "today",
      title: "Payment Successfully!",
      subtitle:
          "Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae",
    ),
    NotificationDetailsModel(
      day: "Yesterday",
      title: "Payment Successfully!",
      subtitle:
          "Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae",
    ),
    NotificationDetailsModel(
      day: "Yesterday",
      title: "Credit Card added!",
      subtitle:
          "Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae",
    ),
    NotificationDetailsModel(
      day: "Yesterday",
      title: "Credit added!",
      subtitle:
          "Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          for (var group in _groupNotificationsByDay(notificationDetails))
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(group.day,
                    style: AppStyles.styleMedium14(context)
                        .copyWith(color: const Color(0xff121212))),
                const SizedBox(height: 8),
                NotificationsCard(notifications: group.notifications),
              ],
            ),
        ],
      ),
    );
  }
}

List<NotificationGroup> _groupNotificationsByDay(
    List<NotificationDetailsModel> notifications) {
  List<NotificationGroup> groups = [];
  for (var notification in notifications) {
    if (groups.isEmpty || groups.last.day != notification.day) {
      groups.add(NotificationGroup(day: notification.day, notifications: []));
    }
    groups.last.notifications.add(notification);
  }
  return groups;
}
