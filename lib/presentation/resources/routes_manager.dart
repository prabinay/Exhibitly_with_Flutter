

import 'package:exhibitly_with_flutter/presentation/intro_screens/onboard_screen.dart';
import 'package:exhibitly_with_flutter/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';



class Routes {
  static const String initialScreenRoute = "/";
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";
  static const String completeProfileScreen = "/completeProfileScreen";
  static const String loginSuccessScreen = "/loginSuccessScreen";
  static const String home = "/home";
  static const String detailScreen = "/detailScreen";
  static const String profileScreen = "/profileScreen";
  static const String cart = "/cart";
  static const String homePage = "/homePage";
  static const String mainPage = "/mainPage";
  static const String detailsPage = "/detailsPage";
}

class RouteGenerator {
  static Route<dynamic> getRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      case Routes.initialScreenRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      // case Routes.signUp:
      //   return MaterialPageRoute(builder: (_) => const SignUpPage());
      // case Routes.homePage:
      //   return MaterialPageRoute(builder: (_) => FeedUI());
      // case Routes.mainPage:
      //   return MaterialPageRoute(builder: (_) => const MainPage());
      // case Routes.detailsPage:
      //   return MaterialPageRoute(builder: (_) => PostDetails());
      // case Routes.signIn:
      //   return MaterialPageRoute(builder: (_) => const LoginPage());
      // case Routes.completeProfileScreen:
      //   return MaterialPageRoute(builder: (_) => const CompleteProfileScreen());
      // case Routes.loginSuccessScreen:
      //   return MaterialPageRoute(builder: (_) => const LoginSuccessScreen());
      // case Routes.home:
      // return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}