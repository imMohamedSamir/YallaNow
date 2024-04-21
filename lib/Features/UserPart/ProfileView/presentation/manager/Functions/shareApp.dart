import 'package:flutter_share/flutter_share.dart';

Future<void> shareApp() async {
  const String appLink =
      'https://play.google.com/store/apps/details?id=com.example.myapp';
  const String message = 'Check out my new app: \n$appLink';

  // Share the app link and message using the share dialog
  await FlutterShare.share(title: 'Share App', text: message);
}
