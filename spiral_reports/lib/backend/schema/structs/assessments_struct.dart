// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssessmentsStruct extends BaseStruct {
  AssessmentsStruct({
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

  static AssessmentsStruct fromMap(Map<String, dynamic> data) =>
      AssessmentsStruct(
        statusCode: castToType<int>(data['statusCode']),
        message: data['message'] as String?,
        data: getStructList(
          data['data'],
          DataStruct.fromMap,
        ),
      );

  static AssessmentsStruct? maybeFromMap(dynamic data) => data is Map
      ? AssessmentsStruct.fromMap(data.cast<String, dynamic>())
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

  static AssessmentsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AssessmentsStruct(
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
  String toString() => 'AssessmentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AssessmentsStruct &&
        statusCode == other.statusCode &&
        message == other.message &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([statusCode, message, data]);
}

AssessmentsStruct createAssessmentsStruct({
  int? statusCode,
  String? message,
}) =>
    AssessmentsStruct(
      statusCode: statusCode,
      message: message,
    );
