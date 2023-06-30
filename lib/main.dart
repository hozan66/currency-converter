import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app.dart';
import 'app/di_container.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DIContainer().init();

  // Force portrait mode
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}
