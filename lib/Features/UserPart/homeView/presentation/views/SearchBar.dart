import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      overlayColor: MaterialStateProperty.all<Color?>(const Color(0xffF5F5F5)),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
          const EdgeInsets.only(left: 16, right: 13)),
      leading: searchIcons(
        icon: Assets.imagesSearchIcon,
        onTap: () {},
      ),
      backgroundColor:
          MaterialStateProperty.all<Color?>(const Color(0xffF5F5F5)),
      elevation: MaterialStateProperty.all<double?>(0),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8) // Set your desired border radius here
            ),
      ),
      hintText: "Search",
      hintStyle: MaterialStateProperty.all<TextStyle?>(
          AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff9E9D9D))),
      trailing: [
        searchIcons(
          icon: Assets.imagesFilterIcon,
          onTap: () {},
        ),
      ],
    );
  }
}

class searchIcons extends StatelessWidget {
  const searchIcons({
    super.key,
    required this.icon,
    this.onTap,
  });
  final String icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: SvgPicture.asset(icon),
    );
  }
}
