import 'package:hive/hive.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_card_model.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/ExtraTypeModel.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/extra.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/size.dart';

void hiveAdapters() async {
  Hive.registerAdapter(SelectedItemsModelAdapter());
  Hive.registerAdapter(ExtraTypeModelAdapter());
  Hive.registerAdapter(ExtraAdapter());
  Hive.registerAdapter(ItemSizeAdapter());
  Hive.registerAdapter(TripCardModelAdapter());
}
