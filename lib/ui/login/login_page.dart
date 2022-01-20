import 'dart:ui';

import 'package:californiaefficiencygroup/ui/login/login_controller.dart';
import 'package:californiaefficiencygroup/ui/login/login_state.dart';
import 'package:flutter/foundation.dart';
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
    final screenSize = MediaQuery.of(context).size;
    const isMobile = !kIsWeb;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenSize.width, // TODO: Replace
            height: screenSize.height, // TODO: Replace
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/nav-cover.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: isMobile
                              ? screenSize.width * 0.9
                              : screenSize.width * 0.7,
                        ),
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 50,
                                ),
                                child: const Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),

                              // Textfield #1, username
                              TextFormField(
                                controller: controller.usernameEditController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Colors.white.withOpacity(.8),
                                  ),
                                  border: InputBorder.none,
                                  hintMaxLines: 1,
                                  hintText: 'User name',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(.5),
                                  ),
                                ),
                                focusNode: controller.usernameNode,
                                onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(controller.emailNode),
                              ),

                              // Textfield #2, email
                              TextFormField(
                                controller: controller.emailEditController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.white.withOpacity(.8),
                                  ),
                                  border: InputBorder.none,
                                  hintMaxLines: 1,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(.5),
                                  ),
                                ),
                                focusNode: controller.emailNode,
                                onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(controller.passwordNode),
                              ),

                              // Textfield #3, password
                              TextFormField(
                                controller: controller.passwordEditController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white.withOpacity(.8),
                                  ),
                                  border: InputBorder.none,
                                  hintMaxLines: 1,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(.5),
                                  ),
                                ),
                                focusNode: controller.passwordNode,
                              ),

                              // Forgot password | Create a new account
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      // TODO: Implement
                                      print('Forgot password button was clicked');
                                    },
                                    child: const Text('Forgot password?'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // TODO: Implement
                                      print('Create account button was clicked');
                                      context.read<LoginStateController>().navigateToSignUp(context);
                                    },
                                    child: const Text('Create a new Account'),
                                  ),
                                ],
                              ),

                              // Sign in
                              TextButton(
                                onPressed: context.select<LoginState, bool>((state) => state.isLoginButtonDisabled) ? null : () {
                                  // TODO: Implement
                                  print('Sign-In button was clicked.');
                                  context.read<LoginStateController>().login(
                                    context,
                                    controller.usernameEditController.text,
                                    controller.emailEditController.text,
                                    controller.passwordEditController.text,
                                  );
                                },
                                child: const Text('Sign-In'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
