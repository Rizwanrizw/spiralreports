// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserQuestionResponseStruct extends BaseStruct {
  UserQuestionResponseStruct({
    String? question,
    bool? considerScore,
    List<OptionsStruct>? selectedAnswer,
  })  : _question = question,
        _considerScore = considerScore,
        _selectedAnswer = selectedAnswer;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "considerScore" field.
  bool? _considerScore;
  bool get considerScore => _considerScore ?? false;
  set considerScore(bool? val) => _considerScore = val;

  bool hasConsiderScore() => _considerScore != null;

  // "selectedAnswer" field.
  List<OptionsStruct>? _selectedAnswer;
  List<OptionsStruct> get selectedAnswer => _selectedAnswer ?? const [];
  set selectedAnswer(List<OptionsStruct>? val) => _selectedAnswer = val;

  void updateSelectedAnswer(Function(List<OptionsStruct>) updateFn) {
    updateFn(_selectedAnswer ??= []);
  }

  bool hasSelectedAnswer() => _selectedAnswer != null;

  static UserQuestionResponseStruct fromMap(Map<String, dynamic> data) =>
      UserQuestionResponseStruct(
        question: data['question'] as String?,
        considerScore: data['considerScore'] as bool?,
        selectedAnswer: getStructList(
          data['selectedAnswer'],
          OptionsStruct.fromMap,
        ),
      );

  static UserQuestionResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? UserQuestionResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'considerScore': _considerScore,
        'selectedAnswer': _selectedAnswer?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'considerScore': serializeParam(
          _considerScore,
          ParamType.bool,
        ),
        'selectedAnswer': serializeParam(
          _selectedAnswer,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static UserQuestionResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserQuestionResponseStruct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        considerScore: deserializeParam(
          data['considerScore'],
          ParamType.bool,
          false,
        ),
        selectedAnswer: deserializeStructParam<OptionsStruct>(
          data['selectedAnswer'],
          ParamType.DataStruct,
          true,
          structBuilder: OptionsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserQuestionResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserQuestionResponseStruct &&
        question == other.question &&
        considerScore == other.considerScore &&
        listEquality.equals(selectedAnswer, other.selectedAnswer);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([question, considerScore, selectedAnswer]);
}

UserQuestionResponseStruct createUserQuestionResponseStruct({
  String? question,
  bool? considerScore,
}) =>
    UserQuestionResponseStruct(
      question: question,
      considerScore: considerScore,
    );
