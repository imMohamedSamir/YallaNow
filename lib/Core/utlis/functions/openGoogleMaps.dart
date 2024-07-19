import 'dart:developer';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openGoogleMaps({
  required LatLng src,
  required LatLng dst,
}) async {
  final Uri googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&origin=${src.latitude},${src.longitude}&destination=${dst.latitude},${dst.longitude}&dir_action=navigate');

  if (await canLaunchUrl(Uri.parse(googleMapsUrl.toString()))) {
    await launchUrl(Uri.parse(googleMapsUrl.toString()));
  } else {
    log('Could not launch $googleMapsUrl');
  }
}
