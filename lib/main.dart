import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yallanow/Core/utlis/functions/ConvertToDp.dart';
import 'package:yallanow/Core/widgets/LandScapeScreen.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/GetLocationPage.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/LoginView.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/SignupView.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/VerificationSignUp.dart';
import 'package:yallanow/Features/MarketsView/presentation/MarketsView.dart';
import 'package:yallanow/Features/MarketsView/presentation/views/MarketPage.dart';
import 'package:yallanow/Features/foodView/presentation/views/BasketPage.dart';
import 'package:yallanow/Features/foodView/presentation/views/FoodResturantPage.dart';
import 'package:yallanow/Features/homeView/presentation/homeView.dart';
import 'package:yallanow/Features/homeView/presentation/views/homeViewBody.dart';
import 'package:yallanow/Features/splashView/splashView.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const YallaNow(),
  ));
}

class YallaNow extends StatelessWidget {
  const YallaNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lock the orientation to portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      initialRoute: routesNames.markets,
      routes: {
        routesNames.splash: (context) => const splashView(),
        routesNames.home: (context) => const homeView(),
        routesNames.resturant: (context) => const FoodResturantPage(),
        routesNames.basket: (context) => const BasketPage(),
        routesNames.markets: (context) => const MarketsView(),
        routesNames.Marketpage: (context) => const MarketPage()
      },
    );
  }
}

class routesNames {
  static const String home = "home";
  static const String resturant = "resturant";
  static const String splash = "splash";
  static const String basket = "basket";
  static const String markets = "markets";
  static const String Marketpage = "Marketpage";
}
