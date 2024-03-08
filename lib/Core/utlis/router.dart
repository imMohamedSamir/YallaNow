// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:yallanow/Features/homeView/homeView.dart';
// import 'package:yallanow/Features/splashView/splashView.dart';

// abstract class AppRouter {
//   static const home = '/home';
//   // static const bookDetails = '/bookDetails';
//   static const Splash = "/";
//   CustomTransitionPage buildPageWithDefaultTransition<T>({
//     required BuildContext context,
//     required GoRouterState state,
//     required Widget child,
//   }) {
//     return CustomTransitionPage<T>(
//       key: state.pageKey,
//       child: child,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//           FadeTransition(opacity: animation, child: child),
//     );
//   }

//   static final GoRouter router = GoRouter(
//     routes: <RouteBase>[
//       GoRoute(
//         path: Splash,
//         builder: (context, GoRouterState state) {
//           return const splashView();
//         },
//       ),
//       GoRoute(
//         path: home,
//         builder: (context, state) => const homeView(),
//         pageBuilder: (context, state) => buildPageWithDefaultTransition(
//           context: context,
//           state: state,
//           child: homeView(),
//         ),
//       ),
//       // GoRoute(
//       //   path: bookDetails,
//       //   builder: (context, state) => const BookDetailsBody(),
//       // ),
//     ],
//   );
// }
