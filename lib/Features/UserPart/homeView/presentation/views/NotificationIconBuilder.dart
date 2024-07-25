import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/NotificationView/data/models/notification_model.dart';

class NotificationIconBuilder extends StatelessWidget {
  const NotificationIconBuilder({
    super.key,
    required this.currentIndex,
  });

  final int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          Hive.box<SavedNotificationModel>(kNotification).listenable(),
      builder: (context, Box<SavedNotificationModel> box, _) {
        // Count unread notifications
        int unreadCount =
            box.values.where((notification) => !notification.isRead).length;

        return Badge(
          label: Text(
            unreadCount.toString(),
            style:
                AppStyles.styleMedium12(context).copyWith(color: Colors.white),
          ),
          isLabelVisible: unreadCount > 0,
          child: SvgPicture.asset(
            currentIndex == 2
                ? Assets.imagesNotificationsIconActive
                : Assets.imagesNotificationsIcon,
          ),
        );
      },
    );
  }
}
