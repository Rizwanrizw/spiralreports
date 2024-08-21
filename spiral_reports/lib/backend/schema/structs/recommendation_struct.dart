// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecommendationStruct extends BaseStruct {
  RecommendationStruct({
    String? data,
    TokensStruct? tokens,
  })  : _data = data,
        _tokens = tokens;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  set data(String? val) => _data = val;

  bool hasData() => _data != null;

  // "tokens" field.
  TokensStruct? _tokens;
  TokensStruct get tokens => _tokens ?? TokensStruct();
  set tokens(TokensStruct? val) => _tokens = val;

  void updateTokens(Function(TokensStruct) updateFn) {
    updateFn(_tokens ??= TokensStruct());
  }

  bool hasTokens() => _tokens != null;

  static RecommendationStruct fromMap(Map<String, dynamic> data) =>
      RecommendationStruct(
        data: data['data'] as String?,
        tokens: TokensStruct.maybeFromMap(data['tokens']),
      );

  static RecommendationStruct? maybeFromMap(dynamic data) => data is Map
      ? RecommendationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data,
        'tokens': _tokens?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.String,
        ),
        'tokens': serializeParam(
          _tokens,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static RecommendationStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecommendationStruct(
        data: deserializeParam(
          data['data'],
          ParamType.String,
          false,
        ),
        tokens: deserializeStructParam(
          data['tokens'],
          ParamType.DataStruct,
          false,
          structBuilder: TokensStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'RecommendationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecommendationStruct &&
        data == other.data &&
        tokens == other.tokens;
  }

  @override
  int get hashCode => const ListEquality().hash([data, tokens]);
}

RecommendationStruct createRecommendationStruct({
  String? data,
  TokensStruct? tokens,
}) =>
    RecommendationStruct(
      data: data,
      tokens: tokens ?? TokensStruct(),
    );
