import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/NotificationView/presentation/NotificationView.dart';

class NotificationItem extends StatelessWidget {
  final NotificationDetailsModel notification;

  const NotificationItem({super.key, required this.notification});

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
