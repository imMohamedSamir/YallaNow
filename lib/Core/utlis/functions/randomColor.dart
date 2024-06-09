import 'dart:math';

import 'package:flutter/material.dart';

Color getRandomColor() {
  final random = Random();
  final hslColor = HSLColor.fromColor(
    Color.fromARGB(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      255, // Full opacity
    ).withOpacity(0.17),
  );
  return hslColor.toColor();
}
