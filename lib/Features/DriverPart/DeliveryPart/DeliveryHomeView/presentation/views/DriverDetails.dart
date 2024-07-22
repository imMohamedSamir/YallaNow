// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:yallanow/Core/utlis/AppSizes.dart';
// import 'package:yallanow/Core/utlis/AppStyles.dart';
// import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/views/CaptinLoading.dart';

// class DriverDetails extends StatelessWidget {
//   const DriverDetails({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CaptinDetailsCubit, CaptinDetailsState>(
//       builder: (context, state) {
//         if (state is CaptinDetailsSuccess) {
//           return Row(
//             children: [
//               ClipOval(
//                 child: Image.network(
//                   state.detailsModel.imageUrl!,
//                   width: AppSizes.getWidth(70, context),
//                   height: AppSizes.getHeight(70, context),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(state.detailsModel.riderName!,
//                       style: AppStyles.styleMedium18(context)),
//                   DriverRatingIndicator(
//                       rate: state.detailsModel.riderRating!.toDouble())
//                 ],
//               )
//             ],
//           );
//         } else {
//           return const CaptinLoading();
//         }
//       },
//     );
//   }
// }

// class DriverRatingIndicator extends StatelessWidget {
//   const DriverRatingIndicator({
//     super.key,
//     required this.rate,
//   });
//   final double rate;
//   @override
//   Widget build(BuildContext context) {
//     return RatingBarIndicator(
//       rating: rate,
//       itemCount: 5,
//       unratedColor: Colors.grey,
//       itemSize: 26,
//       itemBuilder: (context, index) {
//         return const Icon(Icons.star_rate_rounded, color: Color(0xffFEC400));
//       },
//     );
//   }
// }
