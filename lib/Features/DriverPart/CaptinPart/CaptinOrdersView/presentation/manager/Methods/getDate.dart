import 'package:intl/intl.dart';

String getdate({required String date}) {
  String dateTimeString = date;
  DateTime dateTime = DateTime.parse(dateTimeString);

  DateFormat dateFormat = DateFormat.yMMMMd('en_US');
  String formattedDate = dateFormat.format(dateTime);

  DateFormat timeFormat = DateFormat.jm(); // 12-hour format with AM/PM
  String formattedTime = timeFormat.format(dateTime);

  return "$formattedDate $formattedTime";
}
