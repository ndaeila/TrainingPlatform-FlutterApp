import 'package:californiaefficiencygroup/ui/home/home_page.dart';
import 'package:californiaefficiencygroup/ui/login/login_page.dart';
import 'package:californiaefficiencygroup/ui/login/signup/signup_page.dart';
import 'package:californiaefficiencygroup/ui/splash/splash_dart.dart';
import 'package:californiaefficiencygroup/ui/tutorial/tutorial_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CEG Web',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: SplashPage.wrapped,
        '/home': (_) => HomePage(),
        LoginPage.routeName: LoginPage.wrapped,
        SignupPage.routeName: SignupPage.wrapped,
        TutorialPage.routeName: TutorialPage.wrapped
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[350],
      ),
    );
  }
}
