import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/extra.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ExtraAdd.dart';

class ExtraBody extends StatelessWidget {
  const ExtraBody({super.key, required this.extras, required this.itemID});
  final List<Extra> extras;
  final String itemID;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
          children: extras
              .map((extra) => ExtraCard(
                    extra: extra,
                    itemId: itemID,
                  ))
              .toList()),
    );
  }
}

class ExtraCard extends StatelessWidget {
  const ExtraCard({super.key, required this.itemId, required this.extra});
  final String itemId;
  final Extra extra;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Text(
            extra.name ?? '',
            style: AppStyles.styleRegular16(context).copyWith(color: scColor),
          ),
          const Spacer(),
          Text(
            "+ ${extra.price} EGP",
            style: AppStyles.styleRegular12(context).copyWith(color: scColor),
          ),
          const SizedBox(width: 8),
          ExtraAdd(itemId: itemId, extra: extra)
        ],
      ),
    );
  }
}
