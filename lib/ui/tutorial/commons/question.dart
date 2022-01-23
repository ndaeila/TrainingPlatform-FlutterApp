import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
abstract class Question with _$Question {
  const factory Question({
    @JsonKey(name: 'Question') required String question,
    @JsonKey(name: 'Answer') required dynamic answer,
    @Default([]) @JsonKey(name: 'Choices') List<dynamic> choices,
  }) = _Question;

  
  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}