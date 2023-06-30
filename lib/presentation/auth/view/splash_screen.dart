import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/navigation/navigation_service.dart';
import '../../../app/resources/managers/assets_manager.dart';
import '../../../app/resources/managers/routes_manager.dart';
import '../../../app/resources/managers/strings_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      NavigationService().removeAndNavigateToRoute(RouteNames.currency);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: const [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Center(
                  child: Image(
                    width: 200,
                    height: 200,
                    image: AssetImage(ImageAssets.logo),
                  ),
                ),
              ),
            ),
            Text(
              AppStrings.poweredByArcellaCompany,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
