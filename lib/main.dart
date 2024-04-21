import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanow/Core/utlis/AppPrefs.dart';
import 'package:yallanow/Core/utlis/blocObs.dart';
import 'package:yallanow/Core/utlis/location_service.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/Repo/AddressRepoImpl.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/AddressesView.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/auto_complete_places_cubit/auto_complete_places_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/GetLocationPage.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginView.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignupView.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/VerificationSignUp.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/setPassword.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/MarketsView.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketPage.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/PharmacyView.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyPage.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/ScooterRideView.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/functions/RoutesUtlis.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/BasketPage.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantPage.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Repo/HomeRepoImpl.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/MainHomeView.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/fetch_popular_resturants_cubit/fetch_popular_resturants_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/homeViewBody.dart';
import 'package:yallanow/Features/UserPart/splashView/splashView.dart';

void main() async {
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const YallaNow(),
  ));
}

class YallaNow extends StatelessWidget {
  const YallaNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ScooterLocationCubit(LocationService(), RoutesUtils())
                ..getMyCurrentPosition(),
        ),
        BlocProvider(
          create: (context) => CheckPaymentMethodCubit(),
        ),
        BlocProvider(
          create: (context) =>
              AutoCompletePlacesCubit(getIt.get<AddressesRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              FetchPopularResturantsCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        debugShowCheckedModeBanner: false,
        initialRoute: routesNames.splash,
        routes: {
          routesNames.splash: (context) => const SplashView(),
          routesNames.home: (context) => const MainHomeView(),
          routesNames.resturant: (context) => const FoodResturantPage(),
          routesNames.basket: (context) => const BasketPage(),
          routesNames.markets: (context) => const MarketsView(),
          routesNames.marketpage: (context) => const MarketPage(),
          routesNames.pharmacyPage: (context) => const PharmacyView(),
          routesNames.pharmacy: (context) => const PharmacyPage()
        },
      ),
    );
  }
}

class routesNames {
  static const String home = "home";
  static const String resturant = "resturant";
  static const String splash = "splash";
  static const String basket = "basket";
  static const String markets = "markets";
  static const String marketpage = "Marketpage";
  static const String pharmacyPage = "PharmacyPage";
  static const String pharmacy = "pharmacypage";
}
