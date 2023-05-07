import 'package:flutter/material.dart';
import 'package:mvc/utils/routes/routes_name.dart';
import 'package:mvc/view/home_screen.dart';
import 'package:mvc/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Scaffold(
            body: Center(
              child: Text('No Route Defined'),
            ),
          ),
        );
    }
  }
}
