import 'package:flutter/material.dart';
import 'package:yallanow/Features/TrackingView/presentation/views/TrackinViewBody.dart';

class TrackinView extends StatelessWidget {
  const TrackinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TrackinViewBody(),
    );
  }
}
