import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemQyt.dart';

class SelectedItemCard extends StatelessWidget {
  const SelectedItemCard({super.key, required this.selectedItems});
  final SelectedItemsModel selectedItems;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
          height: AppSizes.getHeight(72, context),
          width: 360,
          child: Column(
            children: [
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    selectedItems.img,
                    width: AppSizes.getWidth(75, context),
                    height: AppSizes.getHeight(75, context),
                    fit: BoxFit.cover,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                title: Text(selectedItems.name,
                    style: AppStyles.styleMedium16(context)
                        .copyWith(color: const Color(0xff121212))),
                subtitle: Text("${selectedItems.price} EGP",
                    style: AppStyles.styleRegular14(context)
                        .copyWith(color: const Color(0xff5A5A5A))),
                trailing: SizedBox(
                    height: AppSizes.getHeight(32, context),
                    width: AppSizes.getWidth(116, context),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: FoodItemQyt(
                        currentnumber: int.parse(selectedItems.quantity!),
                      ),
                    )),
              ),
              // SizedBox(height: 1),
              // const Divider(
              //     // height: 24,
              //     )
            ],
          )),
    );
  }
}
