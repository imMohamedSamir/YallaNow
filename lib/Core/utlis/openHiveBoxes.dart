import 'dart:async';

import 'package:hive/hive.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/NotificationView/data/models/notification_model.dart';

Future<void> openHiveBoxes() async {
  await Hive.openBox<SavedNotificationModel>(kNotification);
}
