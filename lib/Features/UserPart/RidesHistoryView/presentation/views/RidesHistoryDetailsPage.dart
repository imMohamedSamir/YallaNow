import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/ContactInfoCard.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderCardHeader.dart';
import 'package:yallanow/Features/UserPart/RidesHistoryView/data/models/UserRideHistoryModel.dart';
import 'package:yallanow/Features/UserPart/RidesHistoryView/presentation/views/UserSrcDstSec.dart';
import 'package:yallanow/generated/l10n.dart';

class RidesHistoryDetailsPage extends StatelessWidget {
  const RidesHistoryDetailsPage({super.key, required this.rideHistory});
  final UserRideHistoryModel rideHistory;

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
                date: rideHistory.date ?? "", isSuccess: getStatus()),
            const SizedBox(height: 16),
            UserSrcDstSec(src: rideHistory.from, dst: rideHistory.to),
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
                  S.of(context).Driver,
                  style: AppStyles.styleMedium16(context),
                ),
                const Spacer(),
                Text(rideHistory.driverName.toString(),
                    style: AppStyles.styleMedium16(context))
              ],
            ),
            const SizedBox(height: 16),
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
