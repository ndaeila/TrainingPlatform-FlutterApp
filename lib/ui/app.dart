import 'package:<name>/ui/home/home_page.dart';
import 'package:<name>/ui/login/login_page.dart';
import 'package:<name>/ui/login/signup/signup_page.dart';
import 'package:<name>/ui/splash/splash_dart.dart';
import 'package:<name>/ui/tutorial/tutorial_page.dart';
import 'package:flutter/material.dart';

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
        TutorialPage.routeName: TutorialPage.wrapped
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
      ),
    );
  }
}
