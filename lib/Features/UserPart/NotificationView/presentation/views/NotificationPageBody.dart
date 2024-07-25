import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart'; // Add this import for date formatting
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/NotificationView/data/models/notification_model.dart';
import 'package:yallanow/Features/UserPart/NotificationView/presentation/manager/Methods/SaveNotificationMethod.dart';
import 'package:yallanow/generated/l10n.dart';

class NotificationPageBody extends StatelessWidget {
  const NotificationPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    deleteOldNotifications();
    markNotificationsAsRead();
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable:
            Hive.box<SavedNotificationModel>(kNotification).listenable(),
        builder: (context, Box<SavedNotificationModel> box, _) {
          if (box.values.isEmpty) {
            return Center(
              child: Text(
                S.of(context).noNotificationsMsg,
                textAlign: TextAlign.center,
                style:
                    AppStyles.styleMedium16(context).copyWith(color: scColor),
              ),
            );
          }

          // Group notifications by date
          Map<String, List<SavedNotificationModel>> groupedNotifications = {};
          for (var notification in box.values) {
            String formattedDate =
                DateFormat.yMMMMd().format(notification.dateTime);
            if (groupedNotifications.containsKey(formattedDate)) {
              groupedNotifications[formattedDate]!.add(notification);
            } else {
              groupedNotifications[formattedDate] = [notification];
            }
          }

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                // shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: groupedNotifications.entries.map((entry) {
                  String date = entry.key;
                  List<SavedNotificationModel> notifications = entry.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child:
                            Text(date, style: AppStyles.styleMedium16(context)),
                      ),
                      ...notifications.map((notification) {
                        return Dismissible(
                          background: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20.0),
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          direction: DismissDirection.endToStart,
                          key: UniqueKey(),
                          onDismissed: (direction) async {
                            await notification.delete();
                          },
                          child: ListTile(
                            title: Text(notification.title,
                                style: AppStyles.styleMedium16(context)),
                            subtitle: Text(notification.body,
                                style: AppStyles.styleMedium14(context)),
                            trailing: Text(
                              DateFormat.Hm().format(notification.dateTime),
                              style: AppStyles.styleMedium14(context),
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
