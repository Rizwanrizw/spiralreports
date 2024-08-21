// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SingleAssessmentStruct extends BaseStruct {
  SingleAssessmentStruct({
    int? statusCode,
    String? message,
    DataStruct? data,
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
  DataStruct? _data;
  DataStruct get data => _data ?? DataStruct();
  set data(DataStruct? val) => _data = val;

  void updateData(Function(DataStruct) updateFn) {
    updateFn(_data ??= DataStruct());
  }

  bool hasData() => _data != null;

  static SingleAssessmentStruct fromMap(Map<String, dynamic> data) =>
      SingleAssessmentStruct(
        statusCode: castToType<int>(data['statusCode']),
        message: data['message'] as String?,
        data: DataStruct.maybeFromMap(data['data']),
      );

  static SingleAssessmentStruct? maybeFromMap(dynamic data) => data is Map
      ? SingleAssessmentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'statusCode': _statusCode,
        'message': _message,
        'data': _data?.toMap(),
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
        ),
      }.withoutNulls;

  static SingleAssessmentStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SingleAssessmentStruct(
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
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: DataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SingleAssessmentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SingleAssessmentStruct &&
        statusCode == other.statusCode &&
        message == other.message &&
        data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([statusCode, message, data]);
}

SingleAssessmentStruct createSingleAssessmentStruct({
  int? statusCode,
  String? message,
  DataStruct? data,
}) =>
    SingleAssessmentStruct(
      statusCode: statusCode,
      message: message,
      data: data ?? DataStruct(),
    );
