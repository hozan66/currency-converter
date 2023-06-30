import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final NavigationService _instance =
      NavigationService._privateConstructor();

  NavigationService._privateConstructor();

  factory NavigationService() {
    return _instance;
  }

  void removeAndNavigateToRoute(String route) {
    navigatorKey.currentState?.popAndPushNamed(route);
  }

  void navigateToRoute(String route) {
    navigatorKey.currentState?.pushNamed(route);
  }

  void removeAndNavigateToPage(Widget page) {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }

  void navigateToPage(Widget page) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }

  // Remove all Pages and push
  void navigateAndFinish(String route) {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      route,
      //if route is returning false replace all pages otherwise just push
      (route) => false,
    );
  }

  String? getCurrentRoute() {
    return ModalRoute.of(navigatorKey.currentState!.context)?.settings.name!;
  }

  void goBack() {
    navigatorKey.currentState?.pop();
  }
}
