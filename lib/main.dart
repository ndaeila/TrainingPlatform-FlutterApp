import 'dart:math';

import 'package:californiaefficiencygroup/ui/app.dart';
import 'package:californiaefficiencygroup/ui/home/home_controller.dart';
import 'package:californiaefficiencygroup/ui/home/home_page.dart';
import 'package:californiaefficiencygroup/commons/widgets/nav-drawer.dart';
import 'package:californiaefficiencygroup/firebase_options.dart';
import 'package:californiaefficiencygroup/ui/home/home_state.dart';
import 'package:californiaefficiencygroup/ui/splash/splash_controller.dart';
import 'package:californiaefficiencygroup/ui/splash/splash_state.dart';

// Import necessary material
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'package:flutter/foundation.dart';

// Terminal Comnmands:
//  check available devices: flutter devices
//  run:
//   chrome: flutter run -d chrome --debug --web-hostname localhost --web-port 8080
//   ios: flutter run
//   verbose: -v

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initializeLogging();
  runApp(
    MultiProvider(
      providers: [
        StateNotifierProvider<SplashController, SplashState>(create: (context) => SplashController(context),),
        StateNotifierProvider<HomeController, HomeState>(create: (_) => HomeController(),)
      ],
      child: App(),
    ),
    
  );
}

void _initializeLogging() {
  Logger.root.level = kReleaseMode ? Level.OFF : Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);
