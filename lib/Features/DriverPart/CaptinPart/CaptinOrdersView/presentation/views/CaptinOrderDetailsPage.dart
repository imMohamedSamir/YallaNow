import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/ContactInfoCard.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/data/models/driver_trips_model/ride_history.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/manager/Methods/getDate.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/views/CaptinSrcDstSec.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderCardHeader.dart';
import 'package:yallanow/generated/l10n.dart';

class CaptinOrderDetailsPage extends StatelessWidget {
  const CaptinOrderDetailsPage({super.key, required this.rideHistory});
  final RideHistory rideHistory;

  @override
  Widget build(BuildContext context) {
    bool getStatus() {
      if (rideHistory.status == 'Completed') {
        return true;
      } else {
        return false;
      }
    }

    return Scaffold(
      appBar: secondAppBar(context, title: S.of(context).tripdetails),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [
            OrderCardHeader(
                date: getdate(date: rideHistory.startTime ?? ""),
                isSuccess: getStatus()),
            const SizedBox(height: 16),
            CaptinSrcDstSec(src: rideHistory.from, dst: rideHistory.to),
            const Divider(height: 32),
            ContactInfoCard(
                isordered: true,
                height: AppSizes.getHeight(55, context),
                title: rideHistory.payment!,
                image: SvgPicture.asset(
                  Assets.imagesCashICon,
                  height: AppSizes.getHeight(20, context),
                  width: AppSizes.getWidth(20, context),
                )),
            const SizedBox(height: 8),
            const Divider(color: Color(0xff9E9D9D)),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  S.of(context).totalDistance,
                  style: AppStyles.styleMedium16(context),
                ),
                const Spacer(),
                Text(
                    "${rideHistory.totalKillos.toString()} ${S.of(context).Km}",
                    style: AppStyles.styleMedium16(context))
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  S.of(context).Totalamount,
                  style: AppStyles.styleMedium16(context),
                ),
                const Spacer(),
                Text("${rideHistory.price} EGP",
                    style: AppStyles.styleMedium16(context))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
