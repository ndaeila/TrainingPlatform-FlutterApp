import 'package:<name>/common/file_reader.dart';
import 'package:<name>/ui/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class HomeController extends StateNotifier<HomeState> with LocatorMixin {
  HomeController() : super(const HomeState());

  VideoPlayerController videoPlayerController =
      VideoPlayerController.asset('assets/videos/Video.mp4');
  ChewieController? chewieController;

  void setDrawerIsOpen(bool b) => state = state.copyWith(drawerIsOpen: b);

  @override
  Future<void> initState() async {
    print('initializing chewie controller');
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
      showControls: false,
    );
    print('INITIALIZED chewie controller');

    final bodyTextElement = await readText();
    state = state.copyWith(bodyTextElement: bodyTextElement);
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  Future<String> readText() async {
    return await FileReader().readFile('description.txt');
  }
}
