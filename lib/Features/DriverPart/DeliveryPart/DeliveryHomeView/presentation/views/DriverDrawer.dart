import 'package:flutter/material.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/views/CaptinProfileOptionsDetails.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/views/DriverCaptinDetails.dart';

class DriverDrawer extends StatelessWidget {
  const DriverDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 45, horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 12),
            DriverCaptinDetails(),
            SizedBox(height: 12),
            CaptinProfileOptionsDetails()
          ],
        ),
      ),
    );
  }
}
