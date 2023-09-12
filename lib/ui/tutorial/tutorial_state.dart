import 'package:<name>/ui/tutorial/commons/question.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutorial_state.freezed.dart';

@freezed
abstract class TutorialState with _$TutorialState {
  const factory TutorialState({
    @Default(false) bool drawerIsOpen,
    @Default({}) Map<String, dynamic> mockJson,
    @Default([]) List<Question> questions,
  }) = _TutorialState;
}
