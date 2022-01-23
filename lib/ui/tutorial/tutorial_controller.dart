import 'package:californiaefficiencygroup/ui/tutorial/commons/question.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:californiaefficiencygroup/ui/tutorial/tutorial_state.dart';

class TutorialController extends StateNotifier<TutorialState>
    with LocatorMixin {
  TutorialController() : super(const TutorialState());

  void setDrawerIsOpen(bool b) => state = state.copyWith(drawerIsOpen: b);

  @override
  void initState() {
    state = state.copyWith(
      questions: <String, Map>{
        "Q1": <String, dynamic>{
          "Answer": 19,
          "Choices": {"C1": 19, "C2": 21, "C3": 81, "C4": 247}.values.toList(),
          "Question": "What is 9 + 10?"
        },
        "Q2": <String, dynamic>{
          "Answer": "Square",
          "Choices": {
            "C1": "Triangle",
            "C2": "Square",
            "C3": "Circle",
            "C4": "Hexagon"
          }.values.toList(),
          "Question":
              "What shape has 4 same sides, 4 angles, always has 360 degrees within, and symmetric over 4 axis?"
        }
      }
          .values
          .map((value) => Question.fromJson(value as Map<String, dynamic>))
          .toList(),
    );
    super.initState();
  }
}