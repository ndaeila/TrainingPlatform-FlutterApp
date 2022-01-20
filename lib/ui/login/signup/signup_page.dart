import 'dart:ui';

import 'package:californiaefficiencygroup/ui/login/signup/signup_controller.dart';
import 'package:californiaefficiencygroup/ui/login/signup/signup_state.dart';
import 'package:flutter/foundation.dart';
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
    final controller = context.watch<SignupController>();
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
                                  'SIGN UP',
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

                              // Return to Sign-In
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      // TODO: Implement
                                      print('Forgot password button was clicked');
                                      Navigator.of(context).popAndPushNamed('/login');
                                    },
                                    child: const Text('Return to Sign-in'),
                                  ),
                                ],
                              ),

                              // Sign in
                              TextButton(
                                onPressed: context.select<SignupState, bool>((state) => state.isSignupButtonDisabled) ? null : () {
                                  // TODO: Implement
                                  print('Sign-Up button was clicked.');
                                  context.read<SignupController>().signup(
                                    context,
                                    controller.usernameEditController.text,
                                    controller.emailEditController.text,
                                    controller.passwordEditController.text,
                                  );
                                },
                                child: const Text('Create Account'),
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
