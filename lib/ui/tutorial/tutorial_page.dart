import 'package:<name>/ui/common/nav-drawer.dart';
import 'package:<name>/ui/tutorial/commons/question.dart';
import 'package:<name>/ui/tutorial/commons/question_card.dart';
import 'package:<name>/ui/tutorial/tutorial_controller.dart';
import 'package:<name>/ui/tutorial/tutorial_state.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tutorial 1
            // "8 Great Work Habits"
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.15,
                vertical: 20,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    width: 5.0,
                    color: Colors.white,
                  ),
                  color: Colors.blue[50],
                ),
                child: const Center(
                  child: Text(
                    'Tutorial 1\n\n"8 Great Work Habits"',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            // [Video Player]
            Material(
              elevation: 10,
              color: Colors.grey[300],
              child: ConstrainedBox(
                constraints: kIsWeb
                    ? BoxConstraints(
                        minHeight: 300,
                        minWidth: 300,
                        maxHeight: screenSize.height * 0.8,
                        maxWidth: screenSize.width * 0.7,
                      )
                    : BoxConstraints(
                        minHeight: 250,
                        minWidth: 270,
                        maxHeight: 300,
                        maxWidth: screenSize.width * 0.9,
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
                    height: 40,
                    child: Center(
                      child: Text('Multiple Choice'),
                    ),
                  ),

                  // Questions
                  SizedBox(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
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
                  MaterialButton(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 16,
                    ),
                    color: Colors.blue[50],
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
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

            const SizedBox(
              height: 20,
            ),

            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        child: Text('1.'),
                        width: 20,
                      ),
                      MaterialButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.018,
                        ),
                        color: Colors.blue[100],
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onPressed: () {
                          //
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: screenSize.width * 0.7,
                            minWidth: 200,
                          ),
                          child: Row(
                            children: [
                              // Microphone icon
                              const Expanded(
                                flex: 1,
                                child: Icon(Icons.mic),
                              ),
                              // Press microphone text
                              const Expanded(
                                flex: 30,
                                child: Text(
                                  'Press the microphone to record',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Audio
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        child: Text('2.'),
                        width: 20,
                      ),
                      MaterialButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.018,
                        ),
                        color: Colors.blue[100],
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onPressed: () {
                          //
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: screenSize.width * 0.7,
                            minWidth: 200,
                          ),
                          child: Row(
                            children: [
                              // Microphone icon
                              const Expanded(
                                flex: 1,
                                child: Icon(Icons.mic),
                              ),
                              // Press microphone text
                              const Expanded(
                                flex: 30,
                                child: Text(
                                  '/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Record
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        child: Text('3.'),
                        width: 20,
                      ),
                      MaterialButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.018,
                        ),
                        color: Colors.blue[100],
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onPressed: () {
                          //
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: screenSize.width * 0.7,
                            minWidth: 200,
                          ),
                          child: Row(
                            children: [
                              // Microphone icon
                              const Expanded(
                                flex: 1,
                                child: Icon(Icons.mic),
                              ),
                              // Press microphone text
                              const Expanded(
                                flex: 30,
                                child: Text(
                                  'Press the microphone to record',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // Submit button
                  MaterialButton(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 16,
                    ),
                    color: Colors.blue[50],
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
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

            const SizedBox(
              height: 20,
            ),

            // Navigators
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Last Tutorial
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      width: 4.0,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
                    ),
                    child: Text('Last Tutorial'),
                  ),
                  onPressed: () {
                    print('>last tutorial');
                  },
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                ),
                // Next Tutorial
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(
                      width: 4.0,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue[50],
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
                    ),
                    child: Text('Next Tutorial'),
                  ),
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
