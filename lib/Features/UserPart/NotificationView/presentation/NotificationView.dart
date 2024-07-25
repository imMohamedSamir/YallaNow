import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/NotificationView/presentation/views/NotificationPageBody.dart';
import 'package:yallanow/generated/l10n.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: secondHomeAppBar(context, title: S.of(context).Notifications),
        body: const NotificationPageBody());
  }
}
