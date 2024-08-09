// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';
// import 'package:yallanow/Core/utlis/AppAssets.dart';
// import 'package:yallanow/Core/utlis/AppStyles.dart';
// import 'package:yallanow/Core/widgets/CustomTextField.dart';
// import 'package:yallanow/generated/l10n.dart';

// class DeliveryProfileViewBody extends StatelessWidget {
//   const DeliveryProfileViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Align(
//         //     alignment: Alignment.center,
//         //     child: DriverImgSec(netImg: captinDetailsModel.imageUrl)),
//         const Gap(16),
//         Text(S.of(context).totalRating,
//             style: AppStyles.styleMedium16(context)),
//         RatingBarIndicator(
//           rating: 5,
//           itemBuilder: (context, index) {
//             return const Icon(Icons.star_rate_rounded,
//                 color: Colors.amber, size: 20.0);
//           },
//         ),
//         const Gap(24),
//         CustomTextField(
//             initialValue: "captinDetailsModel.riderName",
//             label: S.of(context).userName,
//             enabled: false),
//         const Gap(16),
//         CustomTextField(
//             initialValue: "captinDetailsModel.phoneNumber",
//             label: S.of(context).PhoneNumber,
//             enabled: false),
//         const Gap(16),
//         CustomTextField(
//             initialValue: "captinDetailsModel.address",
//             label: S.of(context).address,
//             enabled: false),
//         const Gap(16),
//         Row(
//           children: [
//             Expanded(
//                 child: CustomTextField(
//                     initialValue: "captinDetailsModel.totalTrips.toString()",
//                     label: S.of(context).TotalTrips,
//                     enabled: false)),
//             const Gap(16),
//             Expanded(
//                 child: CustomTextField(
//                     initialValue: "captinDetailsModel.totalKillos.toString()",
//                     label: S.of(context).TotalKillos,
//                     enabled: false)),
//           ],
//         ),
//         const Gap(16),
//         CustomTextField(
//           label: S.of(context).Wallet,
//           initialValue: " EGP",
//           enabled: false,
//           suffixIcon: Padding(
//             padding: const EdgeInsets.all(6.0),
//             child: SvgPicture.asset(Assets.imagesWallet),
//           ),
//           suffixIconConstraints:
//               const BoxConstraints(maxHeight: 36, maxWidth: 46),
//         ),
//       ],
//     );
//   }
// }
