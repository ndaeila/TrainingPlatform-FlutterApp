import 'package:californiaefficiencygroup/ui/common/nav-drawer.dart';
import 'package:californiaefficiencygroup/ui/tutorial/commons/question.dart';
import 'package:californiaefficiencygroup/ui/tutorial/commons/question_card.dart';
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
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: NavDrawer(),
      onDrawerChanged: (isOpened) {
        context.read<TutorialController>().setDrawerIsOpen(isOpened);
      },
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'App Bar',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          StatefulBuilder(
            builder: (context, setState) {
              return MaterialButton(
                child: Icon(
                  Icons.menu_rounded,
                  color: state.drawerIsOpen ? Colors.transparent : Colors.black,
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
      body: Column(
        children: [
          // Tutorial 1
          // "8 Great Work Habits"
          // [Video Player]

          // <Multiple Choice>
          const SizedBox(
            height: 30,
            child: Center(
              child: Text('Multiple Choice'),
            ),
          ),

          // Questions
          SizedBox(
            child: ListView.separated(
              shrinkWrap: true,
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.15),
              itemBuilder: (context, index) =>
                  QuestionCard(state.questions[index]),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: state.questions.length,
            ),
          ),

          // Navigators
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Last Tutorial
              MaterialButton(
                child: Text('Last Tutorial'),
                onPressed: () {
                  print('>last tutorial');
                },
              ),
              // Next Tutorial
              MaterialButton(
                child: Text('Next Tutorial'),
                onPressed: () {
                  print('>next tutorial');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
