// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataStruct extends BaseStruct {
  DataStruct({
    String? title,
    String? description,
    List<String>? tags,
    int? credReq,
    int? levelsReq,
    int? maxLevelScore,
    String? createdBy,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? id,
    List<QuestionSetStruct>? questionSet,
  })  : _title = title,
        _description = description,
        _tags = tags,
        _credReq = credReq,
        _levelsReq = levelsReq,
        _maxLevelScore = maxLevelScore,
        _createdBy = createdBy,
        _status = status,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _id = id,
        _questionSet = questionSet;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  set tags(List<String>? val) => _tags = val;

  void updateTags(Function(List<String>) updateFn) {
    updateFn(_tags ??= []);
  }

  bool hasTags() => _tags != null;

  // "credReq" field.
  int? _credReq;
  int get credReq => _credReq ?? 0;
  set credReq(int? val) => _credReq = val;

  void incrementCredReq(int amount) => credReq = credReq + amount;

  bool hasCredReq() => _credReq != null;

  // "levelsReq" field.
  int? _levelsReq;
  int get levelsReq => _levelsReq ?? 0;
  set levelsReq(int? val) => _levelsReq = val;

  void incrementLevelsReq(int amount) => levelsReq = levelsReq + amount;

  bool hasLevelsReq() => _levelsReq != null;

  // "maxLevelScore" field.
  int? _maxLevelScore;
  int get maxLevelScore => _maxLevelScore ?? 0;
  set maxLevelScore(int? val) => _maxLevelScore = val;

  void incrementMaxLevelScore(int amount) =>
      maxLevelScore = maxLevelScore + amount;

  bool hasMaxLevelScore() => _maxLevelScore != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  set createdBy(String? val) => _createdBy = val;

  bool hasCreatedBy() => _createdBy != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "questionSet" field.
  List<QuestionSetStruct>? _questionSet;
  List<QuestionSetStruct> get questionSet => _questionSet ?? const [];
  set questionSet(List<QuestionSetStruct>? val) => _questionSet = val;

  void updateQuestionSet(Function(List<QuestionSetStruct>) updateFn) {
    updateFn(_questionSet ??= []);
  }

  bool hasQuestionSet() => _questionSet != null;

  static DataStruct fromMap(Map<String, dynamic> data) => DataStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        tags: getDataList(data['tags']),
        credReq: castToType<int>(data['credReq']),
        levelsReq: castToType<int>(data['levelsReq']),
        maxLevelScore: castToType<int>(data['maxLevelScore']),
        createdBy: data['createdBy'] as String?,
        status: data['status'] as String?,
        createdAt: data['createdAt'] as String?,
        updatedAt: data['updatedAt'] as String?,
        id: data['id'] as String?,
        questionSet: getStructList(
          data['questionSet'],
          QuestionSetStruct.fromMap,
        ),
      );

  static DataStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'tags': _tags,
        'credReq': _credReq,
        'levelsReq': _levelsReq,
        'maxLevelScore': _maxLevelScore,
        'createdBy': _createdBy,
        'status': _status,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt,
        'id': _id,
        'questionSet': _questionSet?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'tags': serializeParam(
          _tags,
          ParamType.String,
          isList: true,
        ),
        'credReq': serializeParam(
          _credReq,
          ParamType.int,
        ),
        'levelsReq': serializeParam(
          _levelsReq,
          ParamType.int,
        ),
        'maxLevelScore': serializeParam(
          _maxLevelScore,
          ParamType.int,
        ),
        'createdBy': serializeParam(
          _createdBy,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updatedAt': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'questionSet': serializeParam(
          _questionSet,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        tags: deserializeParam<String>(
          data['tags'],
          ParamType.String,
          true,
        ),
        credReq: deserializeParam(
          data['credReq'],
          ParamType.int,
          false,
        ),
        levelsReq: deserializeParam(
          data['levelsReq'],
          ParamType.int,
          false,
        ),
        maxLevelScore: deserializeParam(
          data['maxLevelScore'],
          ParamType.int,
          false,
        ),
        createdBy: deserializeParam(
          data['createdBy'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updatedAt'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        questionSet: deserializeStructParam<QuestionSetStruct>(
          data['questionSet'],
          ParamType.DataStruct,
          true,
          structBuilder: QuestionSetStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DataStruct &&
        title == other.title &&
        description == other.description &&
        listEquality.equals(tags, other.tags) &&
        credReq == other.credReq &&
        levelsReq == other.levelsReq &&
        maxLevelScore == other.maxLevelScore &&
        createdBy == other.createdBy &&
        status == other.status &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        id == other.id &&
        listEquality.equals(questionSet, other.questionSet);
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        description,
        tags,
        credReq,
        levelsReq,
        maxLevelScore,
        createdBy,
        status,
        createdAt,
        updatedAt,
        id,
        questionSet
      ]);
}

DataStruct createDataStruct({
  String? title,
  String? description,
  int? credReq,
  int? levelsReq,
  int? maxLevelScore,
  String? createdBy,
  String? status,
  String? createdAt,
  String? updatedAt,
  String? id,
}) =>
    DataStruct(
      title: title,
      description: description,
      credReq: credReq,
      levelsReq: levelsReq,
      maxLevelScore: maxLevelScore,
      createdBy: createdBy,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      id: id,
    );
