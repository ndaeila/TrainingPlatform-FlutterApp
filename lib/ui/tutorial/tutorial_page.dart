import 'dart:io';

import 'package:californiaefficiencygroup/ui/common/nav-drawer.dart';
import 'package:californiaefficiencygroup/ui/tutorial/commons/question.dart';
import 'package:californiaefficiencygroup/ui/tutorial/commons/question_card.dart';
import 'package:californiaefficiencygroup/ui/tutorial/tutorial_controller.dart';
import 'package:californiaefficiencygroup/ui/tutorial/tutorial_state.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
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
    final controller = context.read<TutorialController>();

    return Scaffold(
      drawer: NavDrawer(),
      onDrawerChanged: (isOpened) {
        context.read<TutorialController>().setDrawerIsOpen(isOpened);
      },
      appBar: AppBar(
        centerTitle: true,
        title: kIsWeb
            ? SizedBox(
                height: kToolbarHeight - 10,
                child: Row(
                  children: [
                    Image.asset('./images/CEG-icon.png'),
                    const Text("  "),
                    Image.asset('./images/CEG-title.png'),
                  ],
                ),
              )
            : Platform.isAndroid || Platform.isIOS
                ? Text("TODO: Implement android text")
                : Text("IOS Text"),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            // Tutorial 1
            // "8 Great Work Habits"
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.15),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.lightBlue,
                ),
                child: const Center(
                  child: Text(
                    'Tutorial 1\n\n"8 Great Work Habits"',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // [Video Player]
            Material(
              elevation: 10,
              color: Colors.grey[300],
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    // minHeight: 300,
                    // minWidth: 300,
                    // maxHeight: screenSize.height * 0.8,
                    // maxWidth: screenSize.width * 0.7,
                    ),
                child:
                    context.watch<TutorialController>().chewieController == null
                        ? Container()
                        : Chewie(
                            controller: controller.chewieController!,
                          ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // <Multiple Choice>
            Container(
              color: Colors.white,
              child: Column(
                children: [
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
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.15),
                      itemBuilder: (context, index) =>
                          QuestionCard(state.questions[index]),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: state.questions.length,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // Submit button
                  RaisedButton(
                    onPressed: () {
                      // TODO: Implement
                    },
                    child: Container(
                      child: Text(
                        'Submit',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Record yourself saying the pitch 3 times',
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Record
                  MaterialButton(
                    color: Colors.blue[100],
                    onPressed: () {
                      //
                    },
                    child: Row(
                      children: [
                        const Text('1.'),
                        Container(
                          child: Row(
                            // Microphone icon
                            children: [
                              Icon(Icons.mic),
                              Text('Press the microphone to record'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Audio
                  MaterialButton(
                    color: Colors.blue[100],
                    onPressed: () {
                      //
                    },
                    child: Row(
                      children: [
                        Text('2.'),
                        Container(
                          child: Row(
                            // Microphone icon
                            children: [
                              Icon(Icons.mic),
                              Text(
                                '/\\/\\/\\/\\/\\/\\Audio Waves/\\/\\/\\/\\/\\/\\',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Record
                  MaterialButton(
                    color: Colors.blue[100],
                    onPressed: () {
                      //
                    },
                    child: Row(
                      children: [
                        Text('3.'),
                        Container(
                          child: Row(
                            // Microphone icon
                            children: [
                              Icon(Icons.mic),
                              Text('Press the microphone to record'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Submit button
                  RaisedButton(
                    onPressed: () {
                      // TODO: Implement
                    },
                    child: Container(
                      child: Text(
                        'Submit',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Navigators
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Last Tutorial
                MaterialButton(
                  child: const Text('Last Tutorial'),
                  onPressed: () {
                    print('>last tutorial');
                  },
                ),
                // Next Tutorial
                MaterialButton(
                  child: const Text('Next Tutorial'),
                  onPressed: () {
                    print('>next tutorial');
                  },
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
