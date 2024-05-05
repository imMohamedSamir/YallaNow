import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/ContactInfoCard.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/home_address_cubit/home_address_cubit.dart';

class ContactInfoSec extends StatelessWidget {
  const ContactInfoSec({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeAddressCubit, HomeAddressState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Contact Info", style: AppStyles.styleSemiBold16(context)),
            const SizedBox(height: 16),
            ContactInfoCard(
              height: AppSizes.getHeight(101, context),
              title: state is HomeAddressChange ? state.address.city ?? "" : "",
              subtitle:
                  state is HomeAddressChange ? state.address.street ?? "" : "",
              image: SvgPicture.asset(
                Assets.imagesLocationMark,
                height: AppSizes.getHeight(20, context),
                width: AppSizes.getWidth(20, context),
              ),
            ),
            const SizedBox(height: 16),
            ContactInfoCard(
              height: AppSizes.getHeight(55, context),
              title: state is HomeAddressChange
                  ? state.address.contact!.contactPhone ?? ""
                  : "",
              image: Image.asset(
                Assets.imagesPhoneIcon,
                height: AppSizes.getHeight(20, context),
                width: AppSizes.getWidth(20, context),
              ),
            )
          ],
        );
      },
    );
  }
}
