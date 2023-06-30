import 'package:currency_converter/app/resources/managers/routes_manager.dart';
import 'package:currency_converter/app/resources/managers/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation/currency/provider/currency_provider.dart';
import 'di_container.dart';
import 'navigation/navigation_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                sl<CurrencyProvider>()..fetchCurrencyData('USD')),
        // ChangeNotifierProvider(
        //     lazy: false, // Created or loaded as soon as possible
        //     create: (context) => sl<CurrencyProvider>()..getCurrencyData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.navigatorKey,
        title: AppStrings.currencyConverterApp,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RouteNames.initialRoute,
        routes: RouteManager().routes,
      ),
    );
  }
}
