import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/data/models/driver_trips_model/ride_history.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/manager/Methods/getDate.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/views/CaptinOrderDetailsPage.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/views/CaptinSrcDstSec.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderCardHeader.dart';
import 'package:yallanow/generated/l10n.dart';

class CaptinOrderCard extends StatelessWidget {
  const CaptinOrderCard({super.key, required this.rideHistory});
  final RideHistory rideHistory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigateToPage.slideFromRight(
            context: context,
            page: CaptinOrderDetailsPage(rideHistory: rideHistory));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderCardHeader(
                date: getdate(date: rideHistory.startTime ?? ""),
                isSuccess: getStatus()),
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

  bool getStatus() {
    if (rideHistory.status == 'Completed') {
      return true;
    } else {
      return false;
    }
  }
}
