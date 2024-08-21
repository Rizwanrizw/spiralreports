// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionSetStruct extends BaseStruct {
  QuestionSetStruct({
    String? question,
    bool? considerScore,
    List<OptionsStruct>? options,
  })  : _question = question,
        _considerScore = considerScore,
        _options = options;

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

  // "options" field.
  List<OptionsStruct>? _options;
  List<OptionsStruct> get options => _options ?? const [];
  set options(List<OptionsStruct>? val) => _options = val;

  void updateOptions(Function(List<OptionsStruct>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  static QuestionSetStruct fromMap(Map<String, dynamic> data) =>
      QuestionSetStruct(
        question: data['question'] as String?,
        considerScore: data['considerScore'] as bool?,
        options: getStructList(
          data['options'],
          OptionsStruct.fromMap,
        ),
      );

  static QuestionSetStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionSetStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'considerScore': _considerScore,
        'options': _options?.map((e) => e.toMap()).toList(),
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
        'options': serializeParam(
          _options,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static QuestionSetStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionSetStruct(
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
        options: deserializeStructParam<OptionsStruct>(
          data['options'],
          ParamType.DataStruct,
          true,
          structBuilder: OptionsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'QuestionSetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionSetStruct &&
        question == other.question &&
        considerScore == other.considerScore &&
        listEquality.equals(options, other.options);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([question, considerScore, options]);
}

QuestionSetStruct createQuestionSetStruct({
  String? question,
  bool? considerScore,
}) =>
    QuestionSetStruct(
      question: question,
      considerScore: considerScore,
    );
