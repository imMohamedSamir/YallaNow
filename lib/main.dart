import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yallanow/Core/Manager/language_cubit/language_cubit.dart';
import 'package:yallanow/Core/utlis/FirebaseMessagingService.dart';
import 'package:yallanow/Core/utlis/Google_Api_services.dart';
import 'package:yallanow/Core/utlis/HiveAdapters.dart';
import 'package:yallanow/Core/utlis/NotificationHelper.dart';
import 'package:yallanow/Core/utlis/blocObs.dart';
import 'package:yallanow/Core/utlis/functions/configureLogging.dart';
import 'package:yallanow/Core/utlis/location_service.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/Repo/CaptinRequestRepoImpl.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/CaptinHomeView.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/captin_ride_request_cubit/captin_ride_request_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/ready_for_trips_cubit/ready_for_trips_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/manager/captin_map_cubit/captin_map_cubit.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/DeliveryHomeView.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/DriverSignUpView.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/Repo/DriverRegisterationRepoImpl.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/driver_registeration_cubit/driver_registeration_cubit.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/VehicleDetailsView.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/Repo/AddressRepoImpl.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/auto_complete_places_cubit/auto_complete_places_cubit.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/user_addresses_cubit/user_addresses_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/phone_verification_cubit/phone_verification_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginView.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/BasketView.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/Repo/FavoriteRepoImpl.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/presentation/manager/add_fav_cubit/add_fav_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/Repo/MartsRepoImpl.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/MarketsView.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_items_cubit/mart_items_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketPage.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/Repo/PharmacyRepoImpl.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/PharmacyView.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacy_details_cubit/pharmacy_details_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/Repos/ScooterRequestRepoImpl.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/UserRidRequestCubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/send_request_cubit/send_request_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/RatingPage.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/Repo/ScooterRideRepoImpl.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/functions/RoutesUtlis.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/ride_price_cubit/ride_price_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepoImpl.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/TripsVew.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/translate_cubit/translate_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trips_popular_cubit/trips_popular_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsPlaceView.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepoImpl.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/resturant_branches_cubit/resturant_branches_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantPageBody.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Repo/HomeRepoImpl.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/MainHomeView.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/fetch_popular_marts_cubit/fetch_popular_marts_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/fetch_popular_resturants_cubit/fetch_popular_resturants_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/home_address_cubit/home_address_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/MainHomeViewBody.dart';
import 'package:yallanow/Features/UserPart/splashView/splashView.dart';
import 'package:yallanow/firebase_options.dart';
import 'package:yallanow/generated/l10n.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLocator();
  await Hive.initFlutter();
  await initializeNotification();
  hiveAdapters();
  Bloc.observer = SimpleBlocObserver();
  runApp(DevicePreview(
    enabled: false,
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
                ScooterLocationCubit(LocationService(), RoutesUtils())),
        BlocProvider(create: (context) => CheckPaymentMethodCubit()),
        BlocProvider(
          create: (context) =>
              AutoCompletePlacesCubit(getIt.get<AddressesRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              UserAddressesCubit(getIt.get<AddressesRepoImpl>())
                ..getUserAddresses(),
        ),
        BlocProvider(
            create: (context) =>
                FetchPopularResturantsCubit(getIt.get<HomeRepoImpl>())),
        BlocProvider(
            create: (context) =>
                FetchPopularMartsCubit(getIt.get<HomeRepoImpl>())..get()),
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => PhoneVerificationCubit(),
        ),
        BlocProvider(
          create: (context) => BasketManagerCubit()..getBasketItems(),
        ),
        BlocProvider(
          create: (context) =>
              ResturantBranchesCubit(getIt.get<FoodRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => HomeAddressCubit(),
        ),
        BlocProvider(
          create: (context) =>
              MartItemsCubit(getIt.get<MartsRepoImpl>())..getItems(),
        ),
        BlocProvider(
            create: (context) =>
                PharmacyDetailsCubit(getIt.get<PharmacyRepoImpl>())),
        BlocProvider(
            create: (context) =>
                RidePriceCubit(getIt.get<ScooterRideRepoImpl>())),
        BlocProvider(
          create: (context) => UserRidRequestCubit(
              getIt.get<FirebaseMessagingService>(),
              getIt.get<CaptinRequestRepoImpl>())
            ..initialize()
            ..connect(),
        ),
        BlocProvider(
          create: (context) => CaptinMapCubit(LocationService(), RoutesUtils()),
        ),
        BlocProvider(
            create: (context) =>
                Add_Remove_FavCubit(getIt.get<FavoriteRepoImpl>())),
        BlocProvider(
            create: (context) =>
                TranslateCubit(getIt.get<GoogleMapsServices>())),
        BlocProvider(
            create: (context) => CaptinRideRequestCubit(
                getIt.get<FirebaseMessagingService>(),
                getIt.get<CaptinRequestRepoImpl>())),
        BlocProvider(
            create: (context) => DriverRegisterationCubit(
                getIt.get<DriverRegisterationRepoImpl>())),
        BlocProvider(
            create: (context) =>
                SendRequestCubit(getIt.get<ScooterRequestRepoImpl>())),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: state,
            debugShowCheckedModeBanner: false,
            initialRoute: RoutesNames.splash,
            routes: {
              RoutesNames.splash: (context) => const SplashView(),
              RoutesNames.home: (context) => const MainHomeView(),
              RoutesNames.resturant: (context) => const FoodResturantPageBody(),
              RoutesNames.basket: (context) => const BasketPage(),
              RoutesNames.markets: (context) => const MarketsView(),
              RoutesNames.marketpage: (context) => const MarketPage(),
              RoutesNames.pharmacyPage: (context) => const PharmacyView(),
              RoutesNames.loginpage: (context) => const LoginView()
            },
          );
        },
      ),
    );
  }
}

class RoutesNames {
  static const String home = "home";
  static const String resturant = "resturant";
  static const String splash = "splash";
  static const String basket = "basket";
  static const String markets = "markets";
  static const String marketpage = "Marketpagloمe";
  static const String pharmacyPage = "PharmacyPage";
  static const String pharmacy = "pharmacypage";
  static const String loginpage = "loginpage";
}
