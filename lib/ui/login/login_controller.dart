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

  final usernameEditController = TextEditingController();
  final emailEditController = TextEditingController();
  final passwordEditController = TextEditingController();
  FocusNode usernameNode = FocusNode(), emailNode = FocusNode(), passwordNode =FocusNode();

  @override
  Future<void> initState() async {
    super.initState();
    
    state = const LoginState();
  }

  void login(
    BuildContext context,
    String username,
    String email,
    String password,
  ) async {
    state = state.copyWith(isLoginButtonDisabled: true);
    // TODO: Implement request
    print('Logging in...\n{\n\tUser: $username\n\tEmail: $email | Password: $password\n}');
    state = state.copyWith(isLoginButtonDisabled: false);
    return ;
  }

  Future<void> navigateToSignUp(BuildContext context) async {
    Navigator.of(context).pushReplacementNamed('/login/signup');
  }
}
