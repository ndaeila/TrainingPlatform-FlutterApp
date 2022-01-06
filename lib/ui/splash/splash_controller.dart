import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:californiaefficiencygroup/ui/splash/splash_state.dart';

class SplashController extends StateNotifier<SplashState> with LocatorMixin {
  SplashController(this.context) : super(const SplashState());

  final BuildContext context;
}