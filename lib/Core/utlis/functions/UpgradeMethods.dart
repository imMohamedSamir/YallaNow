import 'package:upgrader/upgrader.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/Functions/shareApp.dart';

UpgraderMessages upgraderMessages() {
  UpgraderMessages upgraderMessage =
      UpgraderMessages(code: AppLang.isArabic() ? 'ar' : "en");
  return upgraderMessage;
}

Upgrader upgrader() {
  return Upgrader(
      countryCode: "EG",
      languageCode: AppLang.isArabic() ? 'ar' : "en",
      messages: upgraderMessages(),
      durationUntilAlertAgain: const Duration(days: 1),
      // debugLogging: true,
      debugDisplayOnce: true,
      minAppVersion: "1.0.0");
}

Future<bool> updateLink() async {
  try {
    await updateApp();
    return true;
  } catch (e) {
    return false;
  }
}
