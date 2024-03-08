import 'package:flutter/material.dart';
import 'package:yallanow/Features/splashView/splashView.dart';

void main() {
  runApp(const YallaNow());
}

class YallaNow extends StatelessWidget {
  const YallaNow({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashView(),
      // initialRoute: "splash",
      // routes: {
      //   "splash": (context) => const splashView(),
      //   "home": (context) => homeView(),
      // },
    );
  }
}
