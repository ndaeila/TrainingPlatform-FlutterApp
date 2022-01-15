import 'package:californiaefficiencygroup/firebase_options.dart';
import 'package:californiaefficiencygroup/ui/home/home_page.dart';
import 'package:californiaefficiencygroup/ui/splash/splash_dart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  // final Future<FirebaseApp> _fbApp =
  //     Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'insert title',
      debugShowCheckedModeBanner: !kReleaseMode,
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: SplashPage.wrapped,
        '/home': (_) => HomePage(),
      },
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}
