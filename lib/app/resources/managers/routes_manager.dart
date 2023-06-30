

import '../../../presentation/auth/view/splash_screen.dart';
import '../../../presentation/currency/view/currency_screen.dart';

class RouteNames {
  static const String initialRoute = splash;

  static const String splash="/splash";
  static const String currency="/currency";
}

class RouteManager {
  final routes = {
    RouteNames.splash: (context) => const SplashScreen(),
    RouteNames.currency: (context) => const CurrencyScreen(),
  };
}
