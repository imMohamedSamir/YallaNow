import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class AvailableRideCard extends StatelessWidget {
  const AvailableRideCard({
    super.key,
    required this.availableRideModel,
    this.value,
    this.groupValue,
    this.onChanged,
    required this.isSelected,
  });
  final AvailableRideModel availableRideModel;
  final bool isSelected;

  final value, groupValue;
  final void Function(dynamic)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          border: Border.all(
              width: isSelected ? 2 : .4,
              color: isSelected ? pKcolor : scColor),
          borderRadius: BorderRadius.circular(8)),
      child: RadioListTile(
        activeColor: pKcolor,
        title: Row(
          children: [
            Image.asset(
              availableRideModel.img,
              width: AppSizes.getWidth(90, context),
              height: AppSizes.getHeight(90, context),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(availableRideModel.name,
                    style: AppStyles.styleRegular16(context)),
                Text("${availableRideModel.price} EGP",
                    style: AppStyles.styleBold16(context)),
                Row(
                  children: [
                    Text(availableRideModel.arriveTime,
                        style: AppStyles.styleRegular16(context)),
                    const SizedBox(width: 16),
                    Text("${availableRideModel.distance} min away",
                        style: AppStyles.styleRegular16(context))
                  ],
                )
              ],
            )
          ],
        ),
        contentPadding: EdgeInsets.zero,
        value: value,
        groupValue: groupValue,
        onChanged: (value) {
          onChanged!(value);
        },
      ),
    );
  }
}

class AvailableRideModel {
  final String name, price, arriveTime, distance, img;

  AvailableRideModel(
      {required this.name,
      required this.price,
      required this.arriveTime,
      required this.distance,
      required this.img});
}
