import 'package:californiaefficiencygroup/firebase_options.dart';
import 'package:californiaefficiencygroup/ui/home/home_page.dart';
import 'package:californiaefficiencygroup/ui/login/login_page.dart';
import 'package:californiaefficiencygroup/ui/login/signup/signup_page.dart';
import 'package:californiaefficiencygroup/ui/splash/splash_dart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'insert title',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: SplashPage.wrapped,
        '/home': (_) => HomePage(),
        LoginPage.routeName: LoginPage.wrapped,
        SignupPage.routeName: SignupPage.wrapped,
      },
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}
