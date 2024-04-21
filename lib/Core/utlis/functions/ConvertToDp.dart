import 'package:flutter/material.dart';

extension PixelToDpExtension on BuildContext {
  double pixelToDp(double pixels) {
    // Retrieve the device's pixel ratio using MediaQuery
    double devicePixelRatio = MediaQuery.of(this).devicePixelRatio;

    // Convert pixels to dp using the device's pixel ratio
    return pixels / devicePixelRatio;
  }
}

extension DpToPixelExtension on BuildContext {
  double dpToPixel(double dp) {
    // Retrieve the device's pixel ratio using MediaQuery
    double devicePixelRatio = MediaQuery.of(this).devicePixelRatio;

    // Convert dp to pixels using the device's pixel ratio
    return dp * devicePixelRatio;
  }
}
// designSize: Size(context.pixelToDp(1290), context.pixelToDp(2796)),
