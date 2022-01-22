import 'package:californiaefficiencygroup/common/file_reader.dart';
import 'package:californiaefficiencygroup/ui/home/home_state.dart';
import 'package:state_notifier/state_notifier.dart';

class HomeController extends StateNotifier<HomeState> with LocatorMixin {
  HomeController() : super(const HomeState());

  void setDrawerIsOpen(bool b) => state = state.copyWith(drawerIsOpen: b);

  @override
  Future<void> initState() async {
    super.initState();
    final bodyTextElement = await readText();
    state = state.copyWith(bodyTextElement: bodyTextElement);
  }

  Future<String> readText() async {
    return await FileReader().readFile('description.txt');
  }
}