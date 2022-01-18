import 'dart:math';

import 'package:californiaefficiencygroup/ui/app.dart';
import 'package:californiaefficiencygroup/ui/home/home_controller.dart';
import 'package:californiaefficiencygroup/ui/home/home_page.dart';
import 'package:californiaefficiencygroup/commons/widgets/nav-drawer.dart';
import 'package:californiaefficiencygroup/firebase_options.dart';
import 'package:californiaefficiencygroup/ui/home/home_state.dart';
import 'package:californiaefficiencygroup/ui/login/login_controller.dart';
import 'package:californiaefficiencygroup/ui/login/login_state.dart';
import 'package:californiaefficiencygroup/ui/login/signup/signup_controller.dart';
import 'package:californiaefficiencygroup/ui/login/signup/signup_state.dart';
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
//  Compile for freezed things: flutter pub run build_runner watch --delete-conflicting-outputs

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initializeLogging();
  runApp(
    MultiProvider(
      providers: [
        StateNotifierProvider<SplashController, SplashState>(
          create: (context) => SplashController(context),
        ),
        StateNotifierProvider<LoginStateController, LoginState>(
          create: (_) => LoginStateController(),
        ),
        StateNotifierProvider<SignupController, SignupState>(
          create: (_) => SignupController(),
        ),
        StateNotifierProvider<HomeController, HomeState>(
          create: (_) => HomeController(),
        )
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
