import 'package:californiaefficiencygroup/ui/login/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/single_child_widget.dart';
import 'package:state_notifier/state_notifier.dart';

class LoginStateController extends StateNotifier<LoginState> with LocatorMixin {
  LoginStateController() : super(const LoginState());

  static SingleChildWidget provider(
    BuildContext context, {
    Widget? child,
  }) {
    return StateNotifierProvider<LoginStateController, LoginState>(
      create: (context) => LoginStateController(),
    );
  }

  @override
  Future<void> initState() async {
    super.initState();
    
    state = const LoginState();
  }

  void login() {
    // TODO: Implement
  }
}
