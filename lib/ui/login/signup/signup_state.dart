import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
abstract class SignupState with _$SignupState {
  const factory SignupState({
    @Default(false) bool isSignupButtonDisabled,
    @Default(false) bool isShowPassword,
  }) = _SignupState;
}