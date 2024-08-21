// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EvaluationsStruct extends BaseStruct {
  EvaluationsStruct({
    int? statusCode,
    String? message,
    List<DataStruct>? data,
  })  : _statusCode = statusCode,
        _message = message,
        _data = data;

  // "statusCode" field.
  int? _statusCode;
  int get statusCode => _statusCode ?? 0;
  set statusCode(int? val) => _statusCode = val;

  void incrementStatusCode(int amount) => statusCode = statusCode + amount;

  bool hasStatusCode() => _statusCode != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "data" field.
  List<DataStruct>? _data;
  List<DataStruct> get data => _data ?? const [];
  set data(List<DataStruct>? val) => _data = val;

  void updateData(Function(List<DataStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static EvaluationsStruct fromMap(Map<String, dynamic> data) =>
      EvaluationsStruct(
        statusCode: castToType<int>(data['statusCode']),
        message: data['message'] as String?,
        data: getStructList(
          data['data'],
          DataStruct.fromMap,
        ),
      );

  static EvaluationsStruct? maybeFromMap(dynamic data) => data is Map
      ? EvaluationsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'statusCode': _statusCode,
        'message': _message,
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'statusCode': serializeParam(
          _statusCode,
          ParamType.int,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static EvaluationsStruct fromSerializableMap(Map<String, dynamic> data) =>
      EvaluationsStruct(
        statusCode: deserializeParam(
          data['statusCode'],
          ParamType.int,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        data: deserializeStructParam<DataStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: DataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'EvaluationsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EvaluationsStruct &&
        statusCode == other.statusCode &&
        message == other.message &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([statusCode, message, data]);
}

EvaluationsStruct createEvaluationsStruct({
  int? statusCode,
  String? message,
}) =>
    EvaluationsStruct(
      statusCode: statusCode,
      message: message,
    );
