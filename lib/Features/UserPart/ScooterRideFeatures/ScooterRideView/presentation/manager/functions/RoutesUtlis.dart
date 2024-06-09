import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/models/RouteInfoModel.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/models/location_info/lat_lng.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/models/location_info/location.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/models/location_info/location_info.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/models/routes_model/routes_model.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/functions/RoutesService.dart';

class RoutesUtils {
  Future<RouteInfo> getRouteData(
      {required LatLng desintation, required LatLng src}) async {
    LocationInfoModel origin = LocationInfoModel(
      location: LocationModel(
          latLng: LatLngModel(
        latitude: src.latitude,
        longitude: src.longitude,
      )),
    );
    LocationInfoModel destination = LocationInfoModel(
      location: LocationModel(
          latLng: LatLngModel(
        latitude: desintation.latitude,
        longitude: desintation.longitude,
      )),
    );
    RoutesModel routes = await RoutesService()
        .fetchRoutes(origin: origin, destination: destination);
    PolylinePoints polylinePoints = PolylinePoints();
    List<LatLng> points = getDecodedRoute(polylinePoints, routes);
    double distanceMeters = routes.routes!.first.distanceMeters!.toDouble();
    // double distancePrice = calculateTheDistancePrice(distance: distanceMeters);
    var duration = routes.routes!.first.duration!;
    String routeDurations = calculateDistanceDuration(duration: duration);

    return RouteInfo(
        points: points, distance: distanceMeters, duration: routeDurations);
  }

  String calculateDistanceDuration({required String duration}) {
    double currentDuration = double.parse(duration.replaceAll('s', '')) / 60;
    if (currentDuration > 60) {
      currentDuration = currentDuration / 60;
    }
    dev.log(currentDuration.toString());
    return currentDuration.toString();
  }

  List<LatLng> getDecodedRoute(
      PolylinePoints polylinePoints, RoutesModel routes) {
    List<PointLatLng> result = polylinePoints.decodePolyline(
      routes.routes!.first.polyline!.encodedPolyline!,
    );

    List<LatLng> points =
        result.map((e) => LatLng(e.latitude, e.longitude)).toList();
    return points;
  }

  Set<Polyline> displayRoute(List<LatLng> points,
      {required Set<Polyline> polyLines,
      required GoogleMapController googleMapController}) {
    polyLines.removeWhere((polyLine) => polyLine.polylineId.value == 'route');
    Polyline route = Polyline(
      color: Colors.blue,
      width: 5,
      polylineId: const PolylineId('route'),
      points: points,
    );

    polyLines.add(route);

    LatLngBounds bounds = getLatLngBounds(points);
    googleMapController
        .animateCamera(CameraUpdate.newLatLngBounds(bounds, 130));
    return polyLines;
  }

  LatLngBounds getLatLngBounds(List<LatLng> points) {
    var southWestLatitude = points.first.latitude;
    var southWestLongitude = points.first.longitude;
    var northEastLatitude = points.first.latitude;
    var northEastLongitude = points.first.longitude;

    for (var point in points) {
      southWestLatitude = min(southWestLatitude, point.latitude);
      southWestLongitude = min(southWestLongitude, point.longitude);
      northEastLatitude = max(northEastLatitude, point.latitude);
      northEastLongitude = max(northEastLongitude, point.longitude);
    }

    return LatLngBounds(
        southwest: LatLng(southWestLatitude, southWestLongitude),
        northeast: LatLng(northEastLatitude, northEastLongitude));
  }
}
