import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/resturant_branches_cubit/resturant_branches_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantDescLoading.dart';

class ResturantDescription extends StatelessWidget {
  const ResturantDescription({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResturantBranchesCubit, ResturantBranchesState>(
      builder: (context, state) {
        if (state is ResturantBranchesSuccess) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(state.branchDetails.branchName!,
                      style: AppStyles.styleSemiBold20(context)),
                  const SizedBox(height: 4),
                  Text(state.branchDetails.branchDescription!,
                      style: AppStyles.styleRegular16(context)
                          .copyWith(color: const Color(0xff5A5A5A))),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.access_time_rounded,
                          color: const Color(0xff5A5A5A),
                          size: AppSizes.getWidth(12, context)),
                      const SizedBox(width: 4),
                      Text("20 min", style: AppStyles.styleRegular10(context)),
                      const SizedBox(width: 18),
                      Image.asset(
                        Assets.imagesMotorbike,
                        width: AppSizes.getWidth(12, context),
                        height: AppSizes.getHeight(12, context),
                      ),
                      const SizedBox(width: 4),
                      Text("Free", style: AppStyles.styleRegular10(context))
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.star_rate_rounded,
                color: const Color(0xffFEC400),
                size: AppSizes.getWidth(18, context),
              ),
              const SizedBox(width: 4),
              Text("${state.branchDetails.branchRate} Rating",
                  style: AppStyles.styleRegular12(context)
                      .copyWith(color: scColor)),
            ],
          );
        } else if (state is ResturantBranchesLoading) {
          return const ResturantDescLoading();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
