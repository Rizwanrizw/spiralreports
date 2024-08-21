import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _role = await secureStorage.read(key: 'ff_role') != null
          ? deserializeEnum<UserRole>(
              (await secureStorage.getString('ff_role')))
          : _role;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_user') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_user') ?? '{}';
          _user = UsersStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_primaryPaymentMethod') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_primaryPaymentMethod') ?? '{}';
          _primaryPaymentMethod = PaymentCardItemStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _accessToken =
          await secureStorage.getString('ff_accessToken') ?? _accessToken;
    });
    await _safeInitAsync(() async {
      _refreshToken =
          await secureStorage.getString('ff_refreshToken') ?? _refreshToken;
    });
    await _safeInitAsync(() async {
      _testQuestionSet2 =
          (await secureStorage.getStringList('ff_testQuestionSet2'))?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _testQuestionSet2;
    });
    await _safeInitAsync(() async {
      _response = (await secureStorage.getStringList('ff_response'))?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _response;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  UserRole? _role = UserRole.Admin;
  UserRole? get role => _role;
  set role(UserRole? value) {
    _role = value;
    value != null
        ? secureStorage.setString('ff_role', value.serialize())
        : secureStorage.remove('ff_role');
  }

  void deleteRole() {
    secureStorage.delete(key: 'ff_role');
  }

  UsersStruct _user = UsersStruct.fromSerializableMap(jsonDecode(
      '{\"name\":\"Samjad\",\"companyName\":\"SpiralDesk\",\"avatarURL\":\"https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\"}'));
  UsersStruct get user => _user;
  set user(UsersStruct value) {
    _user = value;
    secureStorage.setString('ff_user', value.serialize());
  }

  void deleteUser() {
    secureStorage.delete(key: 'ff_user');
  }

  void updateUserStruct(Function(UsersStruct) updateFn) {
    updateFn(_user);
    secureStorage.setString('ff_user', _user.serialize());
  }

  PaymentCardItemStruct _primaryPaymentMethod =
      PaymentCardItemStruct.fromSerializableMap(jsonDecode(
          '{\"name\":\"Samjad Mooppan\",\"cardNumber\":\"4261235412221421\",\"expiry\":\"1716309420000\",\"cvv\":\"232\"}'));
  PaymentCardItemStruct get primaryPaymentMethod => _primaryPaymentMethod;
  set primaryPaymentMethod(PaymentCardItemStruct value) {
    _primaryPaymentMethod = value;
    secureStorage.setString('ff_primaryPaymentMethod', value.serialize());
  }

  void deletePrimaryPaymentMethod() {
    secureStorage.delete(key: 'ff_primaryPaymentMethod');
  }

  void updatePrimaryPaymentMethodStruct(
      Function(PaymentCardItemStruct) updateFn) {
    updateFn(_primaryPaymentMethod);
    secureStorage.setString(
        'ff_primaryPaymentMethod', _primaryPaymentMethod.serialize());
  }

  String _accessToken = '';
  String get accessToken => _accessToken;
  set accessToken(String value) {
    _accessToken = value;
    secureStorage.setString('ff_accessToken', value);
  }

  void deleteAccessToken() {
    secureStorage.delete(key: 'ff_accessToken');
  }

  String _refreshToken = '';
  String get refreshToken => _refreshToken;
  set refreshToken(String value) {
    _refreshToken = value;
    secureStorage.setString('ff_refreshToken', value);
  }

  void deleteRefreshToken() {
    secureStorage.delete(key: 'ff_refreshToken');
  }

  List<dynamic> _assessmentsList = [];
  List<dynamic> get assessmentsList => _assessmentsList;
  set assessmentsList(List<dynamic> value) {
    _assessmentsList = value;
  }

  void addToAssessmentsList(dynamic value) {
    assessmentsList.add(value);
  }

  void removeFromAssessmentsList(dynamic value) {
    assessmentsList.remove(value);
  }

  void removeAtIndexFromAssessmentsList(int index) {
    assessmentsList.removeAt(index);
  }

  void updateAssessmentsListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    assessmentsList[index] = updateFn(_assessmentsList[index]);
  }

  void insertAtIndexInAssessmentsList(int index, dynamic value) {
    assessmentsList.insert(index, value);
  }

  List<dynamic> _testQuestionSet2 = [
    jsonDecode('{\"text\":\"string\",\"level\":0}'),
    jsonDecode('{\"text\":\"string2\",\"level\":2}')
  ];
  List<dynamic> get testQuestionSet2 => _testQuestionSet2;
  set testQuestionSet2(List<dynamic> value) {
    _testQuestionSet2 = value;
    secureStorage.setStringList(
        'ff_testQuestionSet2', value.map((x) => jsonEncode(x)).toList());
  }

  void deleteTestQuestionSet2() {
    secureStorage.delete(key: 'ff_testQuestionSet2');
  }

  void addToTestQuestionSet2(dynamic value) {
    testQuestionSet2.add(value);
    secureStorage.setStringList('ff_testQuestionSet2',
        _testQuestionSet2.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTestQuestionSet2(dynamic value) {
    testQuestionSet2.remove(value);
    secureStorage.setStringList('ff_testQuestionSet2',
        _testQuestionSet2.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTestQuestionSet2(int index) {
    testQuestionSet2.removeAt(index);
    secureStorage.setStringList('ff_testQuestionSet2',
        _testQuestionSet2.map((x) => jsonEncode(x)).toList());
  }

  void updateTestQuestionSet2AtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    testQuestionSet2[index] = updateFn(_testQuestionSet2[index]);
    secureStorage.setStringList('ff_testQuestionSet2',
        _testQuestionSet2.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTestQuestionSet2(int index, dynamic value) {
    testQuestionSet2.insert(index, value);
    secureStorage.setStringList('ff_testQuestionSet2',
        _testQuestionSet2.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _response = [];
  List<dynamic> get response => _response;
  set response(List<dynamic> value) {
    _response = value;
    secureStorage.setStringList(
        'ff_response', value.map((x) => jsonEncode(x)).toList());
  }

  void deleteResponse() {
    secureStorage.delete(key: 'ff_response');
  }

  void addToResponse(dynamic value) {
    response.add(value);
    secureStorage.setStringList(
        'ff_response', _response.map((x) => jsonEncode(x)).toList());
  }

  void removeFromResponse(dynamic value) {
    response.remove(value);
    secureStorage.setStringList(
        'ff_response', _response.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromResponse(int index) {
    response.removeAt(index);
    secureStorage.setStringList(
        'ff_response', _response.map((x) => jsonEncode(x)).toList());
  }

  void updateResponseAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    response[index] = updateFn(_response[index]);
    secureStorage.setStringList(
        'ff_response', _response.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInResponse(int index, dynamic value) {
    response.insert(index, value);
    secureStorage.setStringList(
        'ff_response', _response.map((x) => jsonEncode(x)).toList());
  }

  final _getAllAssessmentsAdminAPIManager =
      FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getAllAssessmentsAdminAPI({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getAllAssessmentsAdminAPIManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetAllAssessmentsAdminAPICache() =>
      _getAllAssessmentsAdminAPIManager.clear();
  void clearGetAllAssessmentsAdminAPICacheKey(String? uniqueKey) =>
      _getAllAssessmentsAdminAPIManager.clearRequest(uniqueKey);

  final _getAllEvaluationsAdminAPIManager =
      FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getAllEvaluationsAdminAPI({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getAllEvaluationsAdminAPIManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetAllEvaluationsAdminAPICache() =>
      _getAllEvaluationsAdminAPIManager.clear();
  void clearGetAllEvaluationsAdminAPICacheKey(String? uniqueKey) =>
      _getAllEvaluationsAdminAPIManager.clearRequest(uniqueKey);

  final _getAllAssessmentsUserAPIManager =
      FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getAllAssessmentsUserAPI({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getAllAssessmentsUserAPIManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetAllAssessmentsUserAPICache() =>
      _getAllAssessmentsUserAPIManager.clear();
  void clearGetAllAssessmentsUserAPICacheKey(String? uniqueKey) =>
      _getAllAssessmentsUserAPIManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
