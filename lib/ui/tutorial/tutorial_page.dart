import 'package:californiaefficiencygroup/ui/common/nav-drawer.dart';
import 'package:californiaefficiencygroup/ui/tutorial/tutorial_controller.dart';
import 'package:californiaefficiencygroup/ui/tutorial/tutorial_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage._({Key? key}) : super(key: key);

  static const routeName = '/tutorial';

  static Widget wrapped(BuildContext context) {
    return StateNotifierProvider<TutorialController, TutorialState>(
      create: (context) => TutorialController(),
      child: const TutorialPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TutorialState>();

    return Scaffold(
      drawer: NavDrawer(),
      onDrawerChanged: (isOpened) {
        print('Drawer is ${isOpened ? "open" : "closed"}');
      },
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'App Bar',
          style: TextStyle(color: Colors.black),
        ),
        // foregroundColor: Colors.black,
        actions: [
          StatefulBuilder(
            builder: (context, setState) {
              return MaterialButton(
                child: Icon(
                  Icons.menu_rounded,
                  color: false ? Colors.transparent : Colors.black,
                  size: 40,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            },
          )
        ],
        leadingWidth: 0,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            // Tutorial 1
            // "8 Great Work Habits"
            // [Video Player]

            // <Multiple Choice>
            Text('Multiple Choice'),
            ListView(),

            // Navigators
            Row(
              children: [
                // Last Tutorial

                // Next Tutorial
              ],
            ),
          ],
        ),
      ),
    );
  }
}
