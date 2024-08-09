import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_details_cubit/mart_details_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/AllCategoriesPage.dart';
import 'package:yallanow/generated/l10n.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(S.of(context).Categories, style: AppStyles.styleMedium16(context)),
        const Spacer(),
        GestureDetector(
          onTap: () {
            NavigateToPage.slideFromBottomAndFade(
                context: context, page: const AllCategoriesPage());
          },
          child: BlocBuilder<MartDetailsCubit, MartDetailsState>(
            builder: (context, state) {
              if (state is MartDetailsSuccess &&
                  state.martsDetails.length > 3) {
                return Text(S.of(context).viewAll,
                    style: AppStyles.styleMedium12(context)
                        .copyWith(color: pKcolor));
              }
              return const SizedBox.shrink();
            },
          ),
        )
      ],
    );
  }
}
