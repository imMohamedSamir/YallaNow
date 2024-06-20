import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

Future<void> initializeNotification() async {
  await AwesomeNotifications().initialize(
      "resource://drawable/yallared",
      [
        NotificationChannel(
            icon: "resource://drawable/yallared",
            channelGroupKey: "basic_channel_group",
            channelKey: notifChannelKey,
            channelName: "basic notification",
            channelDescription: "test notification",
            enableVibration: true,
            importance: NotificationImportance.Default,
            criticalAlerts: true,
            soundSource: "resource://raw/res_sound",
            defaultColor: Colors.green,
            channelShowBadge: true,
            playSound: true)
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: "basic_channel_group",
            channelGroupName: "basig group")
      ],
      debug: true);
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      // This is just a basic example. For real apps, you must show some
      // friendly dialog box before call the request method.
      // This is very important to not harm the user experience

      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
}
