import 'package:ecommerceapp/utilites/routes.dart';
import 'package:ecommerceapp/views/pages/LandingPageRoure.dart';
import 'package:ecommerceapp/views/pages/authpage.dart';
import 'package:ecommerceapp/views/pages/homepage.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginpageRoute:
      return CupertinoPageRoute(
          builder: (_) => const Authpage(), settings: settings);

    case AppRoutes.homepageroute:
      return CupertinoPageRoute(
          builder: (_) => const HomePgae(), settings: settings);

    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(
          builder: (_) => const LandingPageRoute(), settings: settings);
  }
}
