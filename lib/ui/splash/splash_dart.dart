import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import 'package:californiaefficiencygroup/ui/splash/splash_state.dart';
import 'package:californiaefficiencygroup/ui/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage._({Key? key}) : super(key: key);

  static const routeName = '/';

  static Widget wrapped(BuildContext context) {
    return StateNotifierProvider<SplashController, SplashState>(
      create: (context) => SplashController(context),
      child: const SplashPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Insert CEG Logo"),
          ],
        ),
      ),
    );
  }
}
