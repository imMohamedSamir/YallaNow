import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/ChooseAddress.dart';
import 'package:yallanow/Core/widgets/basketIconBuilder.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/user_addresses_cubit/user_addresses_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/home_address_cubit/home_address_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/HomeAddressList.dart';

class LocationAppBar extends StatelessWidget {
  const LocationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserAddressesCubit, UserAddressesState>(
      listener: (context, state) {
        if (state is UserAddressesSuccess) {
          checkUserAddresses(context);
        }
      },
      child: ListTile(
        horizontalTitleGap: 6,
        contentPadding: EdgeInsets.zero,
        leading: AspectRatio(
            aspectRatio: 7 / 17,
            child: SvgPicture.asset(Assets.imagesLocationIcon)),
        title: Row(
          children: [
            Text("Deliver to", style: AppStyles.styleMedium16(context)),
            const SizedBox(width: 6),
            SizedBox(
              height: AppSizes.getHeight(24, context),
              width: AppSizes.getWidth(24, context),
              child: Center(
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      addressBottomSheet(context: context);
                    },
                    icon: const Icon(Icons.arrow_drop_down)),
              ),
            )
          ],
        ),
        subtitle: BlocBuilder<HomeAddressCubit, HomeAddressState>(
          builder: (context, state) {
            if (state is HomeAddressChange) {
              var address = state.address;
              return Text("${address.city} - ${address.street}",
                  style: AppStyles.styleRegular12(context));
            } else {
              return Text("Choose your address",
                  style: AppStyles.styleRegular12(context));
            }
          },
        ),
        // trailing: const BasketIconBuilder(),
      ),
    );
  }
}

void addressBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    backgroundColor: Colors.grey[100]!,
    showDragHandle: true,
    context: context,
    builder: (context) {
      return const HomeAddressList();
    },
  );
}
