import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/user_addresses_details_model/user_addresses_details_model.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/home_address_cubit/home_address_cubit.dart';

class HomeAddressCard extends StatelessWidget {
  const HomeAddressCard({super.key, required this.address});
  final UserAddressesDetailsModel address;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ListTile(
          onTap: () {
            BlocProvider.of<HomeAddressCubit>(context)
                .chooseAddress(address: address);
            Navigator.pop(context);
          },
          shape: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff5A5A5A)),
              borderRadius: BorderRadius.circular(8)),
          titleAlignment: ListTileTitleAlignment.titleHeight,
          textColor: const Color(0xff5A5A5A),
          titleTextStyle: AppStyles.styleMedium16(context),
          title: Text(address.city ?? '',
              style: AppStyles.styleMedium16(context).copyWith(color: scColor)),
          subtitle: Text(
            "${address.street} \n ${address.contact?.contactPhone}",
            style: AppStyles.styleRegular14(context)
                .copyWith(color: const Color(0xff5A5A5A)),
          ),
          ////////////////////////////////////
          leading: SvgPicture.asset(
            Assets.imagesLocationMark,
            height: AppSizes.getHeight(20, context),
            width: AppSizes.getWidth(20, context),
          ),
          ////////////////////////////////////
        ));
  }
}
