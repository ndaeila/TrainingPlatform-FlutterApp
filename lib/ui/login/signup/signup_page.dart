import 'package:<name>/ui/login/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  const SignupPage._({Key? key}) : super(key: key);

  static const routeName = '/login/signup';

  static Widget wrapped(BuildContext context) {
    return MultiProvider(
      providers: [
        SignupController.provider(context),
      ],
      child: SignupPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Form(
        child: Center(
          child: Text('TODO: Implement'),
        ),
      ),
    );
  }
}
