import 'package:californiaefficiencygroup/ui/home/home_state.dart';
import 'package:state_notifier/state_notifier.dart';

class HomeController extends StateNotifier<HomeState> with LocatorMixin {
  HomeController() : super(const HomeState());

  @override
  void initState() {
    super.initState();
    state = const HomeState();
  }
}