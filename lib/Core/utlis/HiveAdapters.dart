import 'package:hive/hive.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';

void hiveAdapters() async {
  Hive.registerAdapter(SelectedItemsModelAdapter());
}
