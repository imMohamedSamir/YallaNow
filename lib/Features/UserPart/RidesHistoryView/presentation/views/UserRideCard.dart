import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/views/CaptinSrcDstSec.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderCardHeader.dart';
import 'package:yallanow/Features/UserPart/RidesHistoryView/data/models/UserRideHistoryModel.dart';
import 'package:yallanow/Features/UserPart/RidesHistoryView/presentation/manager/Methods/userRideStatus.dart';
import 'package:yallanow/Features/UserPart/RidesHistoryView/presentation/views/RidesHistoryDetailsPage.dart';
import 'package:yallanow/generated/l10n.dart';

class UserRideCard extends StatelessWidget {
  const UserRideCard({super.key, required this.rideHistory});
  final UserRideHistoryModel rideHistory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigateToPage.slideFromRight(
            context: context,
            page: RidesHistoryDetailsPage(rideHistory: rideHistory));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderCardHeader(
                date: rideHistory.date ?? "",
                isSuccess: userRideStatus(rideHistory.status!)),
            const SizedBox(height: 16),
            CaptinSrcDstSec(src: rideHistory.from, dst: rideHistory.to),
            const Divider(height: 32),
            Text(S.of(context).ViewDetails,
                style: AppStyles.styleMedium16(context)
                    .copyWith(color: const Color(0xff5A5A5A))),
          ],
        ),
      ),
    );
  }
}
