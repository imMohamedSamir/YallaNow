import 'package:yallanow/generated/l10n.dart';
import 'package:yallanow/main.dart';

String? phoneOrMailValidation(String? value) {
  if (value == null || value.trim().isEmpty) {
    return S.of(navigatorKey.currentContext!).MailValidation;
  }
  if (value.startsWith("0")) {
    if (value.length > 11 || value.length < 11) {
      return null;
    }
  } else if (!value.contains("@") || value.trim().isEmpty) {
    return S.of(navigatorKey.currentContext!).correctEmail;
  }
  return null;
}

bool? phoneOrMailCheck(String? value) {
  if (value!.startsWith("0")) {
    if (value.length > 11 || value.length < 11) {
      return true;
    }
    return true;
  } else if (!value.contains("@")) {
    return false;
  }
  return false;
}
