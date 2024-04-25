import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yallanow/Core/Manager/language_cubit/language_cubit.dart';
import 'package:yallanow/Core/utlis/blocObs.dart';
import 'package:yallanow/Core/utlis/location_service.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/Repo/AddressRepoImpl.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/auto_complete_places_cubit/auto_complete_places_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/phone_verification_cubit/phone_verification_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginView.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/MarketsView.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketPage.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/PharmacyView.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyPage.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/functions/RoutesUtlis.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/BasketPage.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantPage.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Repo/HomeRepoImpl.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/MainHomeView.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/fetch_popular_resturants_cubit/fetch_popular_resturants_cubit.dart';
import 'package:yallanow/Features/UserPart/splashView/splashView.dart';
import 'package:yallanow/firebase_options.dart';
import 'package:yallanow/generated/l10n.dart';

void main() async {
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
                ScooterLocationCubit(LocationService(), RoutesUtils())),
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
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => PhoneVerificationCubit(),
        ),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, state) {
          return MaterialApp(
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
              RoutesNames.resturant: (context) => const FoodResturantPage(),
              RoutesNames.basket: (context) => const BasketPage(),
              RoutesNames.markets: (context) => const MarketsView(),
              RoutesNames.marketpage: (context) => const MarketPage(),
              RoutesNames.pharmacyPage: (context) => const PharmacyView(),
              RoutesNames.pharmacy: (context) => const PharmacyPage(),
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
  static const String marketpage = "Marketpage";
  static const String pharmacyPage = "PharmacyPage";
  static const String pharmacy = "pharmacypage";
  static const String loginpage = "loginpage";
}
