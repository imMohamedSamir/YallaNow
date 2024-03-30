import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/foodView/presentation/views/BasketPage.dart';

class LocationAppBar extends StatelessWidget {
  const LocationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 6,
      contentPadding: EdgeInsets.zero,
      leading: AspectRatio(
        aspectRatio: 7 / 17,
        child: SvgPicture.asset(Assets.imagesLocationIcon),
      ),
      title: Text("Deliver to", style: AppStyles.styleMedium16(context)),
      subtitle: Text("299 Hurghada , Egypt. ",
          style: AppStyles.styleRegular12(context)),
      trailing: IconButton(
        icon: const Icon(
          Icons.shopping_cart_outlined,
          color: Color(0xff240301),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BasketPage(),
              ));
        },
      ),
    );
  }
}
