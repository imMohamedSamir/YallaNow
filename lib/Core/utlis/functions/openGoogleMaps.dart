import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

Future<void> openGoogleMaps({
  required double srclat,
  required double srclng,
  required double dstlat,
  required double dstlng,
}) async {
  final Uri googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&origin=$srclat,$srclng&destination=$dstlat,$dstlng&dir_action=navigate');

  if (await canLaunchUrl(Uri.parse(googleMapsUrl.toString()))) {
    await launchUrl(Uri.parse(googleMapsUrl.toString()));
  } else {
    log('Could not launch $googleMapsUrl');
  }
}
