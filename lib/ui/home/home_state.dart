import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default("") String bodyTextElement,
    @Default(false) bool drawerIsOpen,
  }) = _HomeState;
}
