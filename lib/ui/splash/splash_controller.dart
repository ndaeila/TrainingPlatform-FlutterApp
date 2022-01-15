import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:californiaefficiencygroup/ui/splash/splash_state.dart';

class SplashController extends StateNotifier<SplashState> with LocatorMixin {
  SplashController(this.context) : super(const SplashState());

  final BuildContext context;

  @override
  void initState() {
    super.initState();
    initializeLogin();
    // initialize login
    // and notifications too probably
  }

  Future<void> temporaryWork() async {
    print('controllerを動かすために読んでいます');
  }

  Future<void> initializeLogin() async {
    bool isLoggedIn = true;
    if (isLoggedIn) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
        await Navigator.of(context).pushReplacementNamed('/home');
      });
    }
  }
}