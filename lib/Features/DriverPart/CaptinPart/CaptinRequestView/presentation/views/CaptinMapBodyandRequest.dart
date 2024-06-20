import 'package:flutter/material.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinMapBody.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinRequestBuilder.dart';

class CaptinMapBodyandRequest extends StatelessWidget {
  const CaptinMapBodyandRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CaptinMapBody(),
        CaptinRequestBuilder(),
      ],
    );
  }
}
