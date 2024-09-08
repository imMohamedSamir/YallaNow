import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/BasketNoteSec.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/OrderDetails.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/SelectedItemsSec.dart';
import 'package:yallanow/generated/l10n.dart';

class BasketViewBody extends StatelessWidget {
  const BasketViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<SelectedItemsModel>(kBasket);

    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (BuildContext context, box, Widget? child) {
        if (box.isEmpty) {
          return Center(
            child: Text(
              S.of(context).EmptyBasketMsg,
              style: AppStyles.styleSemiBold16(context),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SelectedItemsSec(),
                Spacer(),
                OrderDetails(),
                SizedBox(height: 16),
                BasketNoteSec(),
              ],
            ),
          );
        }
      },
    );
  }
}
