// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponseStruct extends BaseStruct {
  ResponseStruct({
    bool? considerScore,
    String? domain,
    List<OptionsStruct>? options,
    String? question,
    RecommendationStruct? recommendation,
    SummaryStruct? summary,
  })  : _considerScore = considerScore,
        _domain = domain,
        _options = options,
        _question = question,
        _recommendation = recommendation,
        _summary = summary;

  // "considerScore" field.
  bool? _considerScore;
  bool get considerScore => _considerScore ?? false;
  set considerScore(bool? val) => _considerScore = val;

  bool hasConsiderScore() => _considerScore != null;

  // "domain" field.
  String? _domain;
  String get domain => _domain ?? '';
  set domain(String? val) => _domain = val;

  bool hasDomain() => _domain != null;

  // "options" field.
  List<OptionsStruct>? _options;
  List<OptionsStruct> get options => _options ?? const [];
  set options(List<OptionsStruct>? val) => _options = val;

  void updateOptions(Function(List<OptionsStruct>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "recommendation" field.
  RecommendationStruct? _recommendation;
  RecommendationStruct get recommendation =>
      _recommendation ?? RecommendationStruct();
  set recommendation(RecommendationStruct? val) => _recommendation = val;

  void updateRecommendation(Function(RecommendationStruct) updateFn) {
    updateFn(_recommendation ??= RecommendationStruct());
  }

  bool hasRecommendation() => _recommendation != null;

  // "summary" field.
  SummaryStruct? _summary;
  SummaryStruct get summary => _summary ?? SummaryStruct();
  set summary(SummaryStruct? val) => _summary = val;

  void updateSummary(Function(SummaryStruct) updateFn) {
    updateFn(_summary ??= SummaryStruct());
  }

  bool hasSummary() => _summary != null;

  static ResponseStruct fromMap(Map<String, dynamic> data) => ResponseStruct(
        considerScore: data['considerScore'] as bool?,
        domain: data['domain'] as String?,
        options: getStructList(
          data['options'],
          OptionsStruct.fromMap,
        ),
        question: data['question'] as String?,
        recommendation:
            RecommendationStruct.maybeFromMap(data['recommendation']),
        summary: SummaryStruct.maybeFromMap(data['summary']),
      );

  static ResponseStruct? maybeFromMap(dynamic data) =>
      data is Map ? ResponseStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'considerScore': _considerScore,
        'domain': _domain,
        'options': _options?.map((e) => e.toMap()).toList(),
        'question': _question,
        'recommendation': _recommendation?.toMap(),
        'summary': _summary?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'considerScore': serializeParam(
          _considerScore,
          ParamType.bool,
        ),
        'domain': serializeParam(
          _domain,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.DataStruct,
          isList: true,
        ),
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'recommendation': serializeParam(
          _recommendation,
          ParamType.DataStruct,
        ),
        'summary': serializeParam(
          _summary,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResponseStruct(
        considerScore: deserializeParam(
          data['considerScore'],
          ParamType.bool,
          false,
        ),
        domain: deserializeParam(
          data['domain'],
          ParamType.String,
          false,
        ),
        options: deserializeStructParam<OptionsStruct>(
          data['options'],
          ParamType.DataStruct,
          true,
          structBuilder: OptionsStruct.fromSerializableMap,
        ),
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        recommendation: deserializeStructParam(
          data['recommendation'],
          ParamType.DataStruct,
          false,
          structBuilder: RecommendationStruct.fromSerializableMap,
        ),
        summary: deserializeStructParam(
          data['summary'],
          ParamType.DataStruct,
          false,
          structBuilder: SummaryStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ResponseStruct &&
        considerScore == other.considerScore &&
        domain == other.domain &&
        listEquality.equals(options, other.options) &&
        question == other.question &&
        recommendation == other.recommendation &&
        summary == other.summary;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [considerScore, domain, options, question, recommendation, summary]);
}

ResponseStruct createResponseStruct({
  bool? considerScore,
  String? domain,
  String? question,
  RecommendationStruct? recommendation,
  SummaryStruct? summary,
}) =>
    ResponseStruct(
      considerScore: considerScore,
      domain: domain,
      question: question,
      recommendation: recommendation ?? RecommendationStruct(),
      summary: summary ?? SummaryStruct(),
    );
