import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/views/CaptinSrcDstSec.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinMapSec.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/RequestDetails.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/scooter_request_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class CaptinRequestBS extends StatelessWidget {
  const CaptinRequestBS(
      {super.key,
      this.scrollController,
      required this.requestDetails,
      this.isAccepted = false});
  final ScrollController? scrollController;
  final RequestDetails requestDetails;
  final bool isAccepted;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ScooterRequestCubit>(context);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: SingleChildScrollView(
          controller: scrollController ?? null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "${requestDetails.price} EGP",
                    style: AppStyles.styleBold24(context)
                        .copyWith(color: blackdcolor),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        isAccepted
                            ? cubit.emit(ScooterRequestInitial())
                            : Navigator.pop(context);
                      },
                      icon: const Icon(Icons.cancel, size: 28, color: pKcolor))
                ],
              ),
              const SizedBox(height: 16),
              CaptinSrcDstSec(
                src: requestDetails.location,
                dst: requestDetails.destination,
              ),
              const SizedBox(height: 8),
              const Divider(),
              Row(
                children: [
                  Text(
                    requestDetails.userName ?? "",
                    style: AppStyles.styleMedium14(context),
                  ),
                  const Spacer(),
                  Text(
                    "01127523369",
                    style: AppStyles.styleMedium14(context),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(Icons.call, size: 20))
                ],
              ),
              // const Divider(),

              const Divider(),
              Text(
                S.of(context).PaymentMethod,
                style: AppStyles.styleMedium16(context),
              ),
              const SizedBox(height: 8),
              Text(
                requestDetails.paymentMethod ?? "",
                style: AppStyles.styleMedium14(context),
              ),
              // const Spacer(),
              const Gap.expand(50),
              isAccepted
                  ? const SizedBox()
                  : CustomButton(
                      text: S.of(context).Accept,
                      txtcolor: Colors.white,
                      btncolor: pKcolor,
                      onPressed: () async {
                        await cubit.acceptRequest(
                            requestDetails.requestId ?? "",
                            requestDetails: requestDetails);
                        if (!context.mounted) return;
                        Navigator.pop(context);
                        NavigateToPage.slideFromRight(
                            context: context, page: const CaptinMapSec());
                      },
                    ),
              const SizedBox(height: 6)
            ],
          ),
        ),
      ),
    );
  }
}
