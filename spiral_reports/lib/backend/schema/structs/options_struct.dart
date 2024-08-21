// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OptionsStruct extends BaseStruct {
  OptionsStruct({
    String? text,
    int? level,
  })  : _text = text,
        _level = level;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "level" field.
  int? _level;
  int get level => _level ?? 0;
  set level(int? val) => _level = val;

  void incrementLevel(int amount) => level = level + amount;

  bool hasLevel() => _level != null;

  static OptionsStruct fromMap(Map<String, dynamic> data) => OptionsStruct(
        text: data['text'] as String?,
        level: castToType<int>(data['level']),
      );

  static OptionsStruct? maybeFromMap(dynamic data) =>
      data is Map ? OptionsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'level': _level,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'level': serializeParam(
          _level,
          ParamType.int,
        ),
      }.withoutNulls;

  static OptionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      OptionsStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        level: deserializeParam(
          data['level'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'OptionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OptionsStruct && text == other.text && level == other.level;
  }

  @override
  int get hashCode => const ListEquality().hash([text, level]);
}

OptionsStruct createOptionsStruct({
  String? text,
  int? level,
}) =>
    OptionsStruct(
      text: text,
      level: level,
    );
