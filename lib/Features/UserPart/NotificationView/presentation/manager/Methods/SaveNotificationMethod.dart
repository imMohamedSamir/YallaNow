import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hive/hive.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/NotificationView/data/models/notification_model.dart';

Future<void> saveNotificationToHive(
    ReceivedNotification receivedNotification) async {
  final box = Hive.box<SavedNotificationModel>(kNotification);
  final notification = SavedNotificationModel(
    receivedNotification.title ?? 'No Title',
    receivedNotification.body ?? 'No Body',
    DateTime.now(),
  );
  await box.add(notification);
}

Future<void> addNotificationToHive() async {
  final box = Hive.box<SavedNotificationModel>(kNotification);
  final notification = SavedNotificationModel(
    'No Title',
    'No Body',
    DateTime.now(),
  );
  await box.add(notification);
}

void markNotificationsAsRead() async {
  final box = Hive.box<SavedNotificationModel>(kNotification);

  // Mark all notifications as read
  for (var key in box.keys) {
    final notification = box.get(key) as SavedNotificationModel;
    if (!notification.isRead) {
      notification.isRead = true;
      await notification.save();
    }
  }
}

void deleteOldNotifications() async {
  final box = Hive.box<SavedNotificationModel>('notifications');
  final now = DateTime.now();

  // Iterate through all notifications
  for (var key in box.keys) {
    final notification = box.get(key) as SavedNotificationModel;

    // Check if the notification is older than a week
    if (now.difference(notification.dateTime).inDays > 7) {
      await notification.delete();
    }
  }
}
