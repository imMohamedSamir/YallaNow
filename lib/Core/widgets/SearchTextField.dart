import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/marts_search_cubit/marts_search_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacy_search_cubit/pharmacy_search_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/food_search_cubit/food_search_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/home_search_cubit/home_search_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

// height: AppSizes.getHeight(10, context),
// width: AppSizes.getWidth(10, context)
class HomeSearchTextField extends StatelessWidget {
  const HomeSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSearchTextField(
      hintText: "   ${S.of(context).Search}",
      prefixIconConstraints: BoxConstraints(
          maxHeight: AppSizes.getHeight(24, context),
          maxWidth: AppSizes.getWidth(24, context)),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SvgPicture.asset(Assets.imagesSearchIcon, fit: BoxFit.contain),
      ),
      onChanged: (value) {
        BlocProvider.of<HomeSearchCubit>(context).getResult(input: value);
      },
    );
  }
}

class FoodSearchTextField extends StatelessWidget {
  const FoodSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSearchTextField(
      hintText: "   ${S.of(context).Search}",
      prefixIconConstraints: BoxConstraints(
          maxHeight: AppSizes.getHeight(24, context),
          maxWidth: AppSizes.getWidth(24, context)),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SvgPicture.asset(Assets.imagesSearchIcon, fit: BoxFit.contain),
      ),
      onChanged: (value) {
        BlocProvider.of<FoodSearchCubit>(context).getResults(input: value);
      },
    );
  }
}

class MartsSearchTextField extends StatelessWidget {
  const MartsSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSearchTextField(
      hintText: "   ${S.of(context).Search}",
      prefixIconConstraints: BoxConstraints(
          maxHeight: AppSizes.getHeight(24, context),
          maxWidth: AppSizes.getWidth(24, context)),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(right: 4.0, left: 4),
        child: SvgPicture.asset(Assets.imagesSearchIcon, fit: BoxFit.fill),
      ),
      onChanged: (value) {
        BlocProvider.of<MartsSearchCubit>(context).search(input: value);
      },
    );
  }
}

class PharmacySearchTextField extends StatelessWidget {
  const PharmacySearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSearchTextField(
      hintText: "   ${S.of(context).Search}",
      prefixIconConstraints: BoxConstraints(
          maxHeight: AppSizes.getHeight(24, context),
          maxWidth: AppSizes.getWidth(24, context)),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SvgPicture.asset(Assets.imagesSearchIcon, fit: BoxFit.contain),
      ),
      onChanged: (value) {
        BlocProvider.of<PharmacySearchCubit>(context).getResult(input: value);
      },
    );
  }
}

class SearchIcons extends StatelessWidget {
  const SearchIcons({
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
