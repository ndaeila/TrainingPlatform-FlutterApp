import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutorial_state.freezed.dart';

@freezed
abstract class TutorialState with _$TutorialState {
  const factory TutorialState({
    @Default(false) bool isLogin,
  }) = _TutorialState;
}
