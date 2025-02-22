import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/utlis/geolocatorService.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/CaptinHomeView.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/captin_ride_request_cubit/captin_ride_request_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/ready_for_trips_cubit/ready_for_trips_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/manager/captin_map_cubit/captin_map_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinCancelDialog.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginView.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/delete_account_cubit/delete_account_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/UserRidRequestCubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/send_request_cubit/send_request_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/UserCancelDialog.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/DialogButton.dart';
import 'package:yallanow/generated/l10n.dart';

void dialogMethode(BuildContext context, {String? itemId}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Close without adding to basket?",
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          "Your choices for this will be cleared. ",
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          const DialogButton(
              btnColor: Colors.white, textColor: pKcolor, text: "Cancel"),
          DialogButton(
              btnColor: pKcolor,
              textColor: Colors.white,
              text: 'Yes, close',
              onPressed: () {
                if (itemId != null) {
                  BlocProvider.of<BasketManagerCubit>(context)
                      .deleteFromBasket(itemId);
                  Navigator.pop(context);
                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
              })
        ],
      );
    },
  );
}

void sessionExpMethode(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(S.of(context).SessionExpired,
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          S.of(context).SessionExpiredMsg,
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          DialogButton(
              btnColor: pKcolor,
              textColor: Colors.white,
              text: S.of(context).Ok,
              onPressed: () {
                TokenManager.removeToken();
                NavigateToPage.slideFromTopAndRemove(
                    context: context, page: const LoginView());
              })
        ],
      );
    },
  );
}

void captinSessionExpMethode(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(S.of(context).SessionExpired,
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          S.of(context).SessionExpiredMsg,
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          DialogButton(
              btnColor: pKcolor,
              textColor: Colors.white,
              text: S.of(context).Ok,
              onPressed: () async {
                await TokenManager.getUserRole().then((role) {
                  if (role == "Driver") {
                    BlocProvider.of<CaptinRideRequestCubit>(context)
                        .disconnect();
                    BlocProvider.of<ReadyForTripsCubit>(context)
                        .stopListening();
                  }
                });
                await TokenManager.removeToken().then((_) {
                  Navigator.pop(context);
                  NavigateToPage.slideFromTopAndRemove(
                      context: context, page: const LoginView());
                });
              })
        ],
      );
    },
  );
}

void logoutdialogMethode(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(S.of(context).Logoutofyouraccount,
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        actions: [
          DialogButton(
              btnColor: pKcolor,
              textColor: Colors.white,
              text: S.of(context).logout,
              onPressed: () async {
                await TokenManager.getUserRole().then((role) {
                  if (role == "Driver") {
                    BlocProvider.of<CaptinRideRequestCubit>(context)
                        .disconnect();
                    BlocProvider.of<ReadyForTripsCubit>(context)
                        .stopListening();
                  } else {
                    BlocProvider.of<ScooterLocationCubit>(context)
                        .setInitialState();
                    BlocProvider.of<UserRidRequestCubit>(context)
                        .setInitialState();
                    BlocProvider.of<SendRequestCubit>(context).setInitial();
                  }
                });
                await TokenManager.removeToken().then((_) {
                  Navigator.pop(context);
                  NavigateToPage.slideFromTopAndRemove(
                      context: context, page: const LoginView());
                });
              }),
          DialogButton(
              btnColor: Colors.white,
              textColor: pKcolor,
              text: S.of(context).Cancel),
        ],
      );
    },
  );
}

void cancelRidedialogMethode(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(S.of(context).cancelRidequestion,
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          S.of(context).cancelRideMsg,
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          DialogButton(
              btnColor: pKcolor,
              textColor: Colors.white,
              text: S.of(context).Cancel,
              onPressed: () {
                Navigator.pop(context);
                BlocProvider.of<UserRidRequestCubit>(context).setInitialState();

                BlocProvider.of<ScooterLocationCubit>(context)
                    .setInitialState();
                BlocProvider.of<SendRequestCubit>(context).setInitial();
              }),
          DialogButton(
            btnColor: Colors.white,
            textColor: pKcolor,
            text: S.of(context).Iwait,
          ),
        ],
      );
    },
  );
}

void usercancelRidedialogMethode(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(S.of(context).userCancelRide,
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          S.of(context).userCancelRideMsg,
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          DialogButton(
              btnColor: pKcolor,
              textColor: Colors.white,
              text: S.of(context).Ok,
              onPressed: () {
                Navigator.pop(context);
                BlocProvider.of<CaptinMapCubit>(context).cancelListening();
                BlocProvider.of<CaptinRideRequestCubit>(context).setInitial();
                NavigateToPage.slideFromLeftAndRemove(
                    context: context, page: const CaptinHomeView());
              }),
        ],
      );
    },
  );
}

void drivercancelRidedialogMethode(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(S.of(context).driverCancelRide,
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          S.of(context).driverCancelRideMsg,
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          DialogButton(
              btnColor: pKcolor,
              textColor: Colors.white,
              text: S.of(context).Ok,
              onPressed: () {
                Navigator.pop(context);
                BlocProvider.of<UserRidRequestCubit>(context).setInitialState();
                BlocProvider.of<ScooterLocationCubit>(context)
                    .cancelListening();
                BlocProvider.of<ScooterLocationCubit>(context)
                    .setInitialState();
                BlocProvider.of<SendRequestCubit>(context).setInitial();
              }),
        ],
      );
    },
  );
}

void driverCancelMSGdialogMethode(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(S.of(context).cancelRidequestion,
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          S.of(context).cancelRideMsg,
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          DialogButton(
              btnColor: pKcolor,
              textColor: Colors.white,
              text: S.of(context).Cancel,
              onPressed: () {
                Navigator.pop(context);
                BlocProvider.of<UserRidRequestCubit>(context).setInitialState();

                BlocProvider.of<ScooterLocationCubit>(context)
                    .setInitialState();
                BlocProvider.of<SendRequestCubit>(context).setInitial();
              }),
          DialogButton(
            btnColor: Colors.white,
            textColor: pKcolor,
            text: S.of(context).Iwait,
          ),
        ],
      );
    },
  );
}

void cancelDriverRidedialogMethode(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const CaptinCancelDialog();
    },
  );
}

void cancelUserRidedialogMethode(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const UserCancelDialog();
    },
  );
}

void clearTheBasketDialog(BuildContext context, {String? itmeId}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("A new order will clear the basket?",
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          "your basket itmes will be cleared.",
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          DialogButton(
            btnColor: Colors.white,
            textColor: pKcolor,
            text: "Cancel",
            onPressed: () {
              BlocProvider.of<BasketManagerCubit>(context)
                  .deleteFromBasket(itmeId!);
              Navigator.pop(context);
            },
          ),
          DialogButton(
              btnColor: pKcolor,
              textColor: Colors.white,
              text: 'OK',
              onPressed: () {
                BlocProvider.of<BasketManagerCubit>(context)
                    .clearAndAdd(itemID: itmeId);
                Navigator.pop(context);
                Navigator.pop(context);
              })
        ],
      );
    },
  );
}

void clearTheBasketDialogInPage(BuildContext context, {String? itmeId}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("A new order will clear the basket?",
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          "your basket itmes will be cleared.",
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          DialogButton(
            btnColor: Colors.white,
            textColor: pKcolor,
            text: "Cancel",
            onPressed: () {
              BlocProvider.of<BasketManagerCubit>(context)
                  .deleteFromBasket(itmeId!);
              Navigator.pop(context);
            },
          ),
          DialogButton(
              btnColor: pKcolor,
              textColor: Colors.white,
              text: 'OK',
              onPressed: () {
                BlocProvider.of<BasketManagerCubit>(context)
                    .clearAndAdd(itemID: itmeId);
                // BlocProvider.of<ItemPageCubit>(context)
                //     .addToBasket(itemID: itmeId!);
                Navigator.pop(context);
              })
        ],
      );
    },
  );
}

void deleteAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(S.of(context).DeleteAcc,
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          S.of(context).DeleteAccDialogQ,
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          DialogButton(
            btnColor: Colors.white60,
            textColor: pKcolor,
            text: S.of(context).Ok,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          DialogButton(
              btnColor: pKcolor,
              textColor: Colors.white,
              text: S.of(context).Cancel,
              onPressed: () {
                BlocProvider.of<DeleteAccountCubit>(context).delete();
              })
        ],
      );
    },
  );
}

void locationPermissionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(S.of(context).LocationPermissionTitle,
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          S.of(context).LocationPermissionMsg,
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          DialogButton(
            btnColor: Colors.white,
            textColor: pKcolor,
            text: S.of(context).Deny,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          DialogButton(
              btnColor: pKcolor,
              textColor: Colors.white,
              text: S.of(context).Allow,
              onPressed: () {
                LocationService().checkAndRequestLocationPermission();
                Navigator.pop(context);
              })
        ],
      );
    },
  );
}

void checkoutDialog(BuildContext context, {String? msg}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Invalid Transaction",
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          msg ?? '',
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          DialogButton(
            btnColor: pKcolor,
            textColor: Colors.white,
            text: "ok",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
