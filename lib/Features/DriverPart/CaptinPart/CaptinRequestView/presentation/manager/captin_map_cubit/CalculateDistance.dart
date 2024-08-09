import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

double calculateDistance({
  required LatLng src,
  required LatLng dist,
}) {
  const R = 6371; // Radius of the Earth in kilometers
  final dLat = _toRadians(dist.latitude - src.latitude);
  final dLon = _toRadians(dist.longitude - src.longitude);
  final a = sin(dLat / 2) * sin(dLat / 2) +
      cos(_toRadians(src.latitude)) *
          cos(_toRadians(dist.latitude)) *
          sin(dLon / 2) *
          sin(dLon / 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));
  return R * c;
}

double _toRadians(double degree) {
  return degree * pi / 180;
}
