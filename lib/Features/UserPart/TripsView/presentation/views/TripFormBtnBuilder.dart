import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trip_book_cubit/trip_book_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class TripFormBtnBuilder extends StatelessWidget {
  const TripFormBtnBuilder({super.key, required this.fromkey});
  final GlobalKey<FormState> fromkey;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: S.of(context).Yalla,
      txtcolor: Colors.white,
      btncolor: pKcolor,
      onPressed: () {
        BlocProvider.of<TripBookCubit>(context).book(context);
      },
    );
  }
}
