import 'dart:math';

import 'package:californiaefficiencygroup/ui/app.dart';
import 'package:californiaefficiencygroup/ui/home/home_controller.dart';
import 'package:californiaefficiencygroup/ui/home/home_page.dart';
import 'package:californiaefficiencygroup/commons/widgets/nav-drawer.dart';
import 'package:californiaefficiencygroup/ui/home/home_state.dart';
import 'package:californiaefficiencygroup/ui/splash/splash_controller.dart';
import 'package:californiaefficiencygroup/ui/splash/splash_state.dart';

// Import necessary material
import 'package:firebase_core/firebase_core.dart';
import 'package:californiaefficiencygroup/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'package:flutter/foundation.dart';

// Random ID generating package for folder/file names
import 'package:randexp/randexp.dart';

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

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  testDatabaseWorking();
  createRandomIDs();
  runApp(
    MultiProvider(
      providers: [
        StateNotifierProvider<SplashController, SplashState>(
          create: (context) => SplashController(context),
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

// Just as an example, when app loaded, a random test var in realtime database is changed
Future<void> testDatabaseWorking() async {
  DatabaseReference _testing =
      FirebaseDatabase.instance.ref("Tutorials/Tutorial1/Q1/Question");
  DatabaseEvent event = await _testing.once();
  print(event.snapshot.value);
  _testing.set("What is 9 + 10?");
}

// Continue this
// https://firebase.flutter.dev/docs/storage/usage
void testStorageWorking() {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
}

// Random ID Generator for file system
void createRandomIDs() {
  String randomID = RandExp(RegExp(r'^[\w^_]{20}$')).gen();
  print("Random ID: ${randomID}");
}
