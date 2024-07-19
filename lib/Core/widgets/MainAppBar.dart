import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:yallanow/Core/Manager/language_cubit/language_cubit.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/basketIconBuilder.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantHeaderIcon.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/LocationAppBar.dart';
import 'package:yallanow/main.dart';

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

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    scrolledUnderElevation: 0,
    automaticallyImplyLeading: false,
    title: Image.asset(
      Assets.imagesYallaNowLogo,
      height: AppSizes.getHeight(55, navigatorKey.currentContext!),
      width: AppSizes.getWidth(55, navigatorKey.currentContext!),
    ),
  );
// const LocationAppBar()
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
      actions: [LanguageDropdown()]);
}

class LanguageDropdown extends StatefulWidget {
  @override
  _LanguageDropdownState createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String _selectedLanguage = 'English';
  final List<String> _languages = [
    'English',
    'العربية',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: const Icon(Icons.language, color: Colors.black),
          value: _selectedLanguage,
          onChanged: (String? newValue) {
            setState(() {
              _selectedLanguage = newValue!;
              if (_selectedLanguage == 'العربية') {
                BlocProvider.of<LanguageCubit>(context)
                    .changeLanguage(context, const Locale('ar'));
              } else {
                BlocProvider.of<LanguageCubit>(context)
                    .changeLanguage(context, const Locale('en'));
              }
            });
          },
          items: _languages.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(value),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
