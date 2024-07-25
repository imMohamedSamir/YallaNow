import 'package:hive/hive.dart';

part 'notification_model.g.dart';

@HiveType(typeId: 5)
class SavedNotificationModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String body;

  @HiveField(2)
  final DateTime dateTime;

  @HiveField(3)
  bool isRead; // Add this field

  SavedNotificationModel(this.title, this.body, this.dateTime,
      {this.isRead = false});
}
