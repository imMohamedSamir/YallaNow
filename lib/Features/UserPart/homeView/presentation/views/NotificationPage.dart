import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key});

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
    return Scaffold(
      appBar: MainAppBar(context, title: "Notification"),
      body: SingleChildScrollView(
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
      ),
    );
  }

  List<NotificationGroup> _groupNotificationsByDay(
      List<NotificationDetailsModel> notifications) {
    List<NotificationGroup> groups = [];
    notifications.forEach((notification) {
      if (groups.isEmpty || groups.last.day != notification.day) {
        groups.add(NotificationGroup(day: notification.day, notifications: []));
      }
      groups.last.notifications.add(notification);
    });
    return groups;
  }
}

class NotificationsCard extends StatelessWidget {
  final List<NotificationDetailsModel> notifications;

  const NotificationsCard({Key? key, required this.notifications});

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

class NotificationItem extends StatelessWidget {
  final NotificationDetailsModel notification;

  const NotificationItem({Key? key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffF5F5F5),
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 16),
        title: Text(notification.title,
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff121212))),
        subtitle: Text(notification.subtitle,
            style: AppStyles.styleRegular12(context)),
      ),
    );
  }
}

class NotificationDetailsModel {
  final String day, title, subtitle;

  NotificationDetailsModel(
      {required this.day, required this.title, required this.subtitle});
}

class NotificationGroup {
  final String day;
  final List<NotificationDetailsModel> notifications;

  NotificationGroup({required this.day, required this.notifications});
}
