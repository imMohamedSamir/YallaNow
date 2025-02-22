import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/LanguageDropdown.dart';
import 'package:yallanow/Core/widgets/basketIconBuilder.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/edit_user_details_cubit/edit_user_details_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantHeaderIcon.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/LocationAppBar.dart';
import 'package:yallanow/generated/l10n.dart';

AppBar favoriteAppBar(BuildContext context,
    {required String title, bool isOrder = false}) {
  return AppBar(
    title: Text(title, style: AppStyles.styleMedium18(context)),
    titleSpacing: isOrder ? 16 : -8,
    leading: isOrder
        ? null
        : IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
    bottom: TabBar(
      unselectedLabelStyle: AppStyles.styleMedium16(context)
          .copyWith(color: const Color(0xff5A5A5A)),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: const Color(0xffB20404),
      indicatorWeight: 4,
      labelColor: const Color(0xffB20404),
      labelStyle: AppStyles.styleSemiBold18(context)
          .copyWith(color: const Color(0xff5A5A5A)),
      dividerColor: const Color(0xff5A5A5A),
      dividerHeight: 2,
      tabs: const <Widget>[
        Tab(
          text: "Food",
        ),
        Tab(
          text: "Mart",
        ),
        Tab(
          text: "Pharmacy",
        ),
      ],
    ),
  );
}

AppBar mainAppBar(BuildContext context, {required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    titleSpacing: 16,
    title: Text(title, style: AppStyles.styleMedium18(context)),

    // leading: IconButton(
    //     icon: const Icon(Icons.arrow_back_ios),
    //     onPressed: () {
    //       Navigator.pop(context);
    //     })
  );
}

AppBar secondHomeAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    elevation: 0,
    titleSpacing: 16,
    title: Text(title, style: AppStyles.styleMedium18(context)),
  );
}

AppBar authAppBar(BuildContext context, {required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    titleSpacing: 16,
    title: Text(title, style: AppStyles.styleMedium18(context)),
  );
}

AppBar secondAppBar(BuildContext context, {required String title}) {
  return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: -8,
      title: Text(title, style: AppStyles.styleMedium18(context)),
      leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          }));
}

AppBar profileAppBar(BuildContext context,
    {required String title, Widget? action}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    titleSpacing: -8,
    title: Text(title, style: AppStyles.styleMedium18(context)),
    leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        }),
    actions: [
      BlocBuilder<EditUserDetailsCubit, EditUserDetailsState>(
        builder: (context, state) {
          if (state is EditUserDetailsInitial ||
              state is EditUserDetailsSuccess) {
            return TextButton.icon(
                onPressed: () {
                  BlocProvider.of<EditUserDetailsCubit>(context).enableEdite();
                },
                label: Text(
                  S.of(context).edit,
                  style:
                      AppStyles.styleMedium16(context).copyWith(color: pKcolor),
                ));
          }
          return const SizedBox();
        },
      )
    ],
  );
}

AppBar homeAppBar() {
  return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: const LocationAppBar());
}

AppBar categoryAppBar(BuildContext context,
    {required String title, bool isCategory = false}) {
  return AppBar(
    title: Text(title, style: AppStyles.styleRegular16(context)),
    leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.pop(context);
        }),
    actions: [
      isCategory
          ? ResturantHeaderIcon(
              child: SvgPicture.asset(Assets.imagesSearchIcon,
                  colorFilter: const ColorFilter.mode(
                      Color(0xff240301), BlendMode.srcIn)),
              onPressed: () {},
            )
          : const SizedBox(),
      const BasketIconBuilder()
    ],
  );
}

AppBar drAppBar(BuildContext context, {required String title}) {
  return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      titleSpacing: 16,
      title: Text(title, style: AppStyles.styleMedium18(context)),
      actions: const [LanguageDropdown()]);
}
