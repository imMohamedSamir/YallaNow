import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/auto_complete_places_cubit/auto_complete_places_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/AvailableRideBS.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/ResultplacesView.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/ResultsPlacesCard.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/ScooterSearchPage.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/ScooterSearchPageBody.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(61, context),
      width: AppSizes.getWidth(361, context),
      child: Card(
        child: ListTile(
          onTap: () {
            // navigateToSearchPage(
            //     context: context, pageBuilder: () => const ScooterSearchPage());
            AvailableRideBSmethod(context);
            // showModalBottomSheet(
            //   isDismissible: false,
            //   useRootNavigator: true,
            //   context: context,
            //   isScrollControlled: true,
            //   builder: (context) {
            //     return ScooterSearchPage();
            //   },
            // );
            // Los Gatos, CA, USA
          },
          leading: SvgPicture.asset(Assets.imagesSearchIcon),
          title: Text(
            "Where to?",
            style: AppStyles.styleBold18(context).copyWith(color: scColor),
          ),
        ),
      ),
    );
  }

  void navigateToSearchPage(
      {required BuildContext context, required Widget Function() pageBuilder}) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration:
            const Duration(milliseconds: 300), // Adjust the duration as needed
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return pageBuilder();
        },
      ),
    );
  }
}

class test extends StatelessWidget {
  const test({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                await BlocProvider.of<ScooterLocationCubit>(context)
                    .SelectedLocation(description: "Los Gatos, CA, USA");
                Navigator.pop(context);
              },
              child: Text("getrouts"))
        ],
      ),
    );
  }
}
