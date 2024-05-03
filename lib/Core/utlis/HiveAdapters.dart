import 'package:hive/hive.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/ExtraTypeModel.dart';

void hiveAdapters() async {
  Hive.registerAdapter(SelectedItemsModelAdapter());
  Hive.registerAdapter(ExtraTypeModelAdapter());
}
