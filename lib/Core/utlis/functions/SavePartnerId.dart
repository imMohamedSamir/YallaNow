import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

void savePartnerId({required String id, required int type}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(partnerId, id);
  prefs.setInt(partnerType, type);
}

Future<String> getPartnerId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.getString(partnerId) != null) {
    log(prefs.getString(partnerId)!);
    return prefs.getString(partnerId)!;
  } else {
    return '';
  }
}

Future<int?> getPartnerType() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.getInt(partnerType) != null) {
    log(prefs.getInt(partnerType).toString());
    return prefs.getInt(partnerType)!;
  } else {
    return null;
  }
}
