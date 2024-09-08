import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddressSearchSec.dart';
import 'package:yallanow/generated/l10n.dart';

class AddressSearchBtn extends StatelessWidget {
  const AddressSearchBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(61, context),
      width: AppSizes.getWidth(361, context),
      child: Card(
        child: ListTile(
          onTap: () {
            showModalBottomSheet(
              constraints: const BoxConstraints.expand(),
              context: context,
              isScrollControlled: true,
              enableDrag: true,
              showDragHandle: true,
              builder: (context) {
                return const AddressSearchSec();
              },
            );
          },
          leading: SvgPicture.asset(Assets.imagesSearchIcon),
          title: Text(
            S.of(context).Search,
            style: AppStyles.styleBold18(context).copyWith(color: scColor),
          ),
        ),
      ),
    );
  }
}
