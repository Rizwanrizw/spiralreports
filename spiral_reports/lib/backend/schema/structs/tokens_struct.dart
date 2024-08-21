// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TokensStruct extends BaseStruct {
  TokensStruct({
    int? completionTokens,
    int? promptTokens,
    int? totalTokens,
  })  : _completionTokens = completionTokens,
        _promptTokens = promptTokens,
        _totalTokens = totalTokens;

  // "completionTokens" field.
  int? _completionTokens;
  int get completionTokens => _completionTokens ?? 0;
  set completionTokens(int? val) => _completionTokens = val;

  void incrementCompletionTokens(int amount) =>
      completionTokens = completionTokens + amount;

  bool hasCompletionTokens() => _completionTokens != null;

  // "promptTokens" field.
  int? _promptTokens;
  int get promptTokens => _promptTokens ?? 0;
  set promptTokens(int? val) => _promptTokens = val;

  void incrementPromptTokens(int amount) =>
      promptTokens = promptTokens + amount;

  bool hasPromptTokens() => _promptTokens != null;

  // "totalTokens" field.
  int? _totalTokens;
  int get totalTokens => _totalTokens ?? 0;
  set totalTokens(int? val) => _totalTokens = val;

  void incrementTotalTokens(int amount) => totalTokens = totalTokens + amount;

  bool hasTotalTokens() => _totalTokens != null;

  static TokensStruct fromMap(Map<String, dynamic> data) => TokensStruct(
        completionTokens: castToType<int>(data['completionTokens']),
        promptTokens: castToType<int>(data['promptTokens']),
        totalTokens: castToType<int>(data['totalTokens']),
      );

  static TokensStruct? maybeFromMap(dynamic data) =>
      data is Map ? TokensStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'completionTokens': _completionTokens,
        'promptTokens': _promptTokens,
        'totalTokens': _totalTokens,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'completionTokens': serializeParam(
          _completionTokens,
          ParamType.int,
        ),
        'promptTokens': serializeParam(
          _promptTokens,
          ParamType.int,
        ),
        'totalTokens': serializeParam(
          _totalTokens,
          ParamType.int,
        ),
      }.withoutNulls;

  static TokensStruct fromSerializableMap(Map<String, dynamic> data) =>
      TokensStruct(
        completionTokens: deserializeParam(
          data['completionTokens'],
          ParamType.int,
          false,
        ),
        promptTokens: deserializeParam(
          data['promptTokens'],
          ParamType.int,
          false,
        ),
        totalTokens: deserializeParam(
          data['totalTokens'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TokensStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TokensStruct &&
        completionTokens == other.completionTokens &&
        promptTokens == other.promptTokens &&
        totalTokens == other.totalTokens;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([completionTokens, promptTokens, totalTokens]);
}

TokensStruct createTokensStruct({
  int? completionTokens,
  int? promptTokens,
  int? totalTokens,
}) =>
    TokensStruct(
      completionTokens: completionTokens,
      promptTokens: promptTokens,
      totalTokens: totalTokens,
    );
