import 'package:hive/hive.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';

double getSubTotalPrice() {
  double totalPrice = 0;
  var box = Hive.box<SelectedItemsModel>(kBasket);
  for (var key in box.keys) {
    var item = box.get(key);
    if (item != null) {
      totalPrice += double.parse(item.price);
    }
  }
  return totalPrice;
}
