import 'package:californiaefficiencygroup/ui/tutorial/commons/question.dart';
import 'package:chewie/chewie.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:californiaefficiencygroup/ui/tutorial/tutorial_state.dart';
import 'package:video_player/video_player.dart';

class TutorialController extends StateNotifier<TutorialState>
    with LocatorMixin {
  TutorialController() : super(const TutorialState());

  VideoPlayerController videoPlayerController =
      VideoPlayerController.network('assets/videos/Tutorial1.mp4');
  ChewieController? chewieController;

  void setDrawerIsOpen(bool b) => state = state.copyWith(drawerIsOpen: b);

  @override
  Future<void> initState() async {
    print('initializing chewie controller');
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
      autoInitialize: true,
      showControls: true,
      allowFullScreen: false, // Do not change
      allowMuting: false, // This too!
    );
    print('INITIALIZED chewie controller');
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
