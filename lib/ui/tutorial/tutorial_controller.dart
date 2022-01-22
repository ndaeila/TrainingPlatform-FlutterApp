import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:californiaefficiencygroup/ui/tutorial/tutorial_state.dart';

class TutorialController extends StateNotifier<TutorialState> with LocatorMixin {
  TutorialController() : super(const TutorialState());

  @override
  void initState() {
    super.initState();
  }
}