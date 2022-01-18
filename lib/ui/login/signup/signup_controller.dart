import 'dart:convert';

import 'package:californiaefficiencygroup/ui/login/signup/signup_controller.dart';
import 'package:californiaefficiencygroup/ui/login/signup/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/single_child_widget.dart';
import 'package:state_notifier/state_notifier.dart';

class SignupController extends StateNotifier<SignupState> with LocatorMixin {
  SignupController() : super(const SignupState());

  static SingleChildWidget provider(BuildContext context, {Widget? child}) {
    return StateNotifierProvider<SignupController, SignupState>(
      create: (context) => SignupController(),
    );
  }
}