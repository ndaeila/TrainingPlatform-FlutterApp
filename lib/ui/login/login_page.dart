import 'package:californiaefficiencygroup/ui/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage._({Key? key}) : super(key: key);

  static const routeName = '/login';

  static Widget wrapped(BuildContext context) {
    return MultiProvider(
      providers: [
        LoginStateController.provider(context),
      ],
      child: const LoginPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LoginStateController>();

    return Scaffold(
      body: Container( // TODO: Implement AsertImage
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/nav-cover.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
