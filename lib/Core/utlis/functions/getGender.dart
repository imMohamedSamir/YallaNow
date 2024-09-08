import 'package:yallanow/Core/utlis/AppLang.dart';

String getGender({required String gender}) {
  if (AppLang.isArabic()) {
    if (gender == "Male" || gender == "male") {
      return "ذكر";
    } else {
      return "اثنى";
    }
  } else {
    return gender;
  }
}

String getPaymentMethod({required String method}) {
  if (AppLang.isArabic()) {
    if (method == "Cash" || method == "cash") {
      return "نقدى";
    } else if (method == "Wallet") {
      return "محفظة";
    } else {
      return "فيزا";
    }
  } else {
    return method;
  }
}
