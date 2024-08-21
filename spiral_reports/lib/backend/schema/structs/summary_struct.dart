// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SummaryStruct extends BaseStruct {
  SummaryStruct({
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

  static SummaryStruct fromMap(Map<String, dynamic> data) => SummaryStruct(
        data: data['data'] as String?,
        tokens: TokensStruct.maybeFromMap(data['tokens']),
      );

  static SummaryStruct? maybeFromMap(dynamic data) =>
      data is Map ? SummaryStruct.fromMap(data.cast<String, dynamic>()) : null;

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

  static SummaryStruct fromSerializableMap(Map<String, dynamic> data) =>
      SummaryStruct(
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
  String toString() => 'SummaryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SummaryStruct &&
        data == other.data &&
        tokens == other.tokens;
  }

  @override
  int get hashCode => const ListEquality().hash([data, tokens]);
}

SummaryStruct createSummaryStruct({
  String? data,
  TokensStruct? tokens,
}) =>
    SummaryStruct(
      data: data,
      tokens: tokens ?? TokensStruct(),
    );
