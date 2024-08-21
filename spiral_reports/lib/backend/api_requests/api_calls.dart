import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start SpiralReports User API Group Code

class SpiralReportsUserAPIGroup {
  static String getBaseUrl({
    String? acessToken = '',
  }) =>
      'http://24.199.69.208:3333/api';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [acessToken]',
    'Content-Type': 'application/json',
    'accept': '/',
  };
  static UserLoginCall userLoginCall = UserLoginCall();
  static AuthRefreshCall authRefreshCall = AuthRefreshCall();
  static UserSignupCall userSignupCall = UserSignupCall();
  static UserProfileCall userProfileCall = UserProfileCall();
  static GetAllAssessmentsCall getAllAssessmentsCall = GetAllAssessmentsCall();
  static SearchAssessmentCall searchAssessmentCall = SearchAssessmentCall();
  static GetSingleAssessmentCall getSingleAssessmentCall =
      GetSingleAssessmentCall();
  static AssessmentEvaluationCall assessmentEvaluationCall =
      AssessmentEvaluationCall();
  static AssessmentEvaluationCopyCall assessmentEvaluationCopyCall =
      AssessmentEvaluationCopyCall();
  static GetAllEvaluationsCall getAllEvaluationsCall = GetAllEvaluationsCall();
  static GetSingleEvaluationCall getSingleEvaluationCall =
      GetSingleEvaluationCall();
  static DeleteEvaluationCall deleteEvaluationCall = DeleteEvaluationCall();
}

class UserLoginCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? acessToken = '',
  }) async {
    final baseUrl = SpiralReportsUserAPIGroup.getBaseUrl(
      acessToken: acessToken,
    );

    final ffApiRequestBody = '''
{
  "username": "${username}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'User Login',
      apiUrl: '${baseUrl}/auth/user/login',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${acessToken}',
        'Content-Type': 'application/json',
        'accept': '/',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? accessToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.access_token''',
      ));
  String? refreshToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.refresh_token''',
      ));
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user._id''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.firstName''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.lastName''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.email''',
      ));
  String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.country''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.phone''',
      ));
  String? credits(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.credits''',
      ));
}

class AuthRefreshCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? refreshToken = '',
    String? acessToken = '',
  }) async {
    final baseUrl = SpiralReportsUserAPIGroup.getBaseUrl(
      acessToken: acessToken,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userID}",
  "refreshToken": "${refreshToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Auth Refresh',
      apiUrl: '${baseUrl}/auth/user/refresh',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${acessToken}',
        'Content-Type': 'application/json',
        'accept': '/',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? accessToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.access_token''',
      ));
  String? refreshToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.refresh_token''',
      ));
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user._id''',
      ));
}

class UserSignupCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? middleName = '',
    String? lastName = '',
    String? email = '',
    String? country = '',
    int? phone,
    String? password = '',
    String? acessToken = '',
  }) async {
    final baseUrl = SpiralReportsUserAPIGroup.getBaseUrl(
      acessToken: acessToken,
    );

    final ffApiRequestBody = '''
{
  "firstName": "${firstName}",
  "middleName": "${middleName}",
  "lastName": "${lastName}",
  "email": "${email}",
  "country": "${country}",
  "phone": ${phone},
  "credits": 0,
  "password": "${password}",
  "status": "ACTIVE"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'User Signup',
      apiUrl: '${baseUrl}/users/signup',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${acessToken}',
        'Content-Type': 'application/json',
        'accept': '/',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? accessToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.access_token''',
      ));
  String? refreshToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.refresh_token''',
      ));
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user._id''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.firstName''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.lastName''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.email''',
      ));
  String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.country''',
      ));
  String? phoneNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.phone''',
      ));
  String? userCredits(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.credits''',
      ));
}

class UserProfileCall {
  Future<ApiCallResponse> call({
    String? acessToken = '',
  }) async {
    final baseUrl = SpiralReportsUserAPIGroup.getBaseUrl(
      acessToken: acessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'User Profile',
      apiUrl: '${baseUrl}/users/profile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${acessToken}',
        'Content-Type': 'application/json',
        'accept': '/',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllAssessmentsCall {
  Future<ApiCallResponse> call({
    String? acessToken = '',
  }) async {
    final baseUrl = SpiralReportsUserAPIGroup.getBaseUrl(
      acessToken: acessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get All Assessments',
      apiUrl: '${baseUrl}/assessments',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${acessToken}',
        'Content-Type': 'application/json',
        'accept': '/',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? assessmentData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class SearchAssessmentCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? acessToken = '',
  }) async {
    final baseUrl = SpiralReportsUserAPIGroup.getBaseUrl(
      acessToken: acessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Search Assessment',
      apiUrl: '${baseUrl}/assessments',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${acessToken}',
        'Content-Type': 'application/json',
        'accept': '/',
      },
      params: {
        'query': query,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? assessmentData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetSingleAssessmentCall {
  Future<ApiCallResponse> call({
    String? assessmentID = '',
    String? acessToken = '',
  }) async {
    final baseUrl = SpiralReportsUserAPIGroup.getBaseUrl(
      acessToken: acessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Single Assessment',
      apiUrl: '${baseUrl}/assessments/${assessmentID}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${acessToken}',
        'Content-Type': 'application/json',
        'accept': '/',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? createdBy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.createdBy''',
      ));
  int? maxLevelScore(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.maxLevelScore''',
      ));
  int? levelsRequired(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.levelsReq''',
      ));
  int? creditsRequired(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.credReq''',
      ));
  List? questions(dynamic response) => getJsonField(
        response,
        r'''$.data.questionSet''',
        true,
      ) as List?;
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.status''',
      ));
  String? updatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.updatedAt''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.createdAt''',
      ));
  List<String>? tags(dynamic response) => (getJsonField(
        response,
        r'''$.data.tags''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.description''',
      ));
  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.title''',
      ));
  List<String>? assessmentQuestions(dynamic response) => (getJsonField(
        response,
        r'''$.data.questionSet[:].question''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AssessmentEvaluationCall {
  Future<ApiCallResponse> call({
    String? assessmentID = '',
    int? creditsUsed,
    int? levels,
    dynamic? responseJson,
    String? acessToken = '',
  }) async {
    final baseUrl = SpiralReportsUserAPIGroup.getBaseUrl(
      acessToken: acessToken,
    );

    final response = _serializeJson(responseJson, true);
    final ffApiRequestBody = '''
{
  "assessmentId": "${assessmentID}",
  "creditsUsed": ${creditsUsed},
  "levels": ${levels},
  "response": ${response},
  "toolsUsed": [
    "slack",
    "hotmail",
    "2fa"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Assessment Evaluation',
      apiUrl: '${baseUrl}/evaluations',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${acessToken}',
        'Content-Type': 'application/json',
        'accept': '/',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? evaluationData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  dynamic? summaryData(dynamic response) => getJsonField(
        response,
        r'''$.data.response[:].summary''',
      );
}

class AssessmentEvaluationCopyCall {
  Future<ApiCallResponse> call({
    String? assessmentID = '',
    int? creditsUsed,
    int? levels,
    int? maxLevelScore,
    dynamic? responseJson,
    String? acessToken = '',
  }) async {
    final baseUrl = SpiralReportsUserAPIGroup.getBaseUrl(
      acessToken: acessToken,
    );

    final response = _serializeJson(responseJson, true);
    final ffApiRequestBody = '''
{
  "assessmentId": "${assessmentID}",
  "creditsUsed": ${creditsUsed},
  "levels": ${levels},
  "response": ${response},
  "toolsUsed": [
    "slack",
    "hotmail",
    "2fa"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Assessment Evaluation Copy',
      apiUrl: '${baseUrl}/evaluations',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${acessToken}',
        'Content-Type': 'application/json',
        'accept': '/',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? evaluationData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  dynamic? summaryData(dynamic response) => getJsonField(
        response,
        r'''$.data.response[:].summary''',
      );
}

class GetAllEvaluationsCall {
  Future<ApiCallResponse> call({
    String? acessToken = '',
  }) async {
    final baseUrl = SpiralReportsUserAPIGroup.getBaseUrl(
      acessToken: acessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get All Evaluations',
      apiUrl: '${baseUrl}/evaluations',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${acessToken}',
        'Content-Type': 'application/json',
        'accept': '/',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? evaluationList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetSingleEvaluationCall {
  Future<ApiCallResponse> call({
    String? evaluationID = '',
    String? acessToken = '',
  }) async {
    final baseUrl = SpiralReportsUserAPIGroup.getBaseUrl(
      acessToken: acessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Single Evaluation',
      apiUrl: '${baseUrl}/evaluations/${evaluationID}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${acessToken}',
        'Content-Type': 'application/json',
        'accept': '/',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? evaluationData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class DeleteEvaluationCall {
  Future<ApiCallResponse> call({
    String? evaluationID = '',
    String? acessToken = '',
  }) async {
    final baseUrl = SpiralReportsUserAPIGroup.getBaseUrl(
      acessToken: acessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Evaluation',
      apiUrl: '${baseUrl}/evaluations/${evaluationID}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${acessToken}',
        'Content-Type': 'application/json',
        'accept': '/',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End SpiralReports User API Group Code

/// Start SpiralReports Admin API Group Code

class SpiralReportsAdminAPIGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'http://24.199.69.208:3333/api';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [accessToken]',
  };
  static AdminLoginCall adminLoginCall = AdminLoginCall();
  static AdminRefreshCall adminRefreshCall = AdminRefreshCall();
  static CreateAdminUserCall createAdminUserCall = CreateAdminUserCall();
  static GetAdminProfileCall getAdminProfileCall = GetAdminProfileCall();
  static CreateAssessmentCall createAssessmentCall = CreateAssessmentCall();
  static GetAllAssessmentsAdminCall getAllAssessmentsAdminCall =
      GetAllAssessmentsAdminCall();
  static GetSingleAssessmentAdminCall getSingleAssessmentAdminCall =
      GetSingleAssessmentAdminCall();
  static UpdateAssessmentCall updateAssessmentCall = UpdateAssessmentCall();
  static DeleteAssessmentCall deleteAssessmentCall = DeleteAssessmentCall();
  static GetAllEvaluationsAdminCall getAllEvaluationsAdminCall =
      GetAllEvaluationsAdminCall();
  static GetSingleEvaluationAdminCall getSingleEvaluationAdminCall =
      GetSingleEvaluationAdminCall();
  static DeleteEvaluationAdminCall deleteEvaluationAdminCall =
      DeleteEvaluationAdminCall();
}

class AdminLoginCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? accessToken = '',
  }) async {
    final baseUrl = SpiralReportsAdminAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "username": "${username}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Admin Login',
      apiUrl: '${baseUrl}/auth/admin/login',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? accessToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.access_token''',
      ));
  String? refreshToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.refresh_token''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.admin.firstName''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.admin.lastName''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.admin.email''',
      ));
  String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.admin.country''',
      ));
  String? phoneNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.admin.phone''',
      ));
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.admin._id''',
      ));
}

class AdminRefreshCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? refreshToken = '',
    String? accessToken = '',
  }) async {
    final baseUrl = SpiralReportsAdminAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userID}",
  "refreshToken": "${refreshToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Admin Refresh',
      apiUrl: '${baseUrl}/auth/auth/refresh',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? accessToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.access_token''',
      ));
  String? refreshToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.refresh_token''',
      ));
}

class CreateAdminUserCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? middleName = '',
    String? lastName = '',
    String? email = '',
    String? country = '',
    int? phone,
    String? password = '',
    String? status = 'ACTIVE',
    String? accessToken = '',
  }) async {
    final baseUrl = SpiralReportsAdminAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "firstName": "${firstName}",
  "middleName": "${middleName}",
  "lastName": "${lastName}",
  "email": "${email}",
  "country": "${country}",
  "phone": ${phone},
  "password": "${password}",
  "status": "${status}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Admin User',
      apiUrl: '${baseUrl}/admin/create',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAdminProfileCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = SpiralReportsAdminAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Admin Profile',
      apiUrl: '${baseUrl}/admin/profile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateAssessmentCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? description = '',
    List<String>? tagsList,
    int? creditsRequired,
    int? levelsReq,
    int? maxLevelScore,
    dynamic? questionSetJson,
    String? status = '',
    String? accessToken = '',
  }) async {
    final baseUrl = SpiralReportsAdminAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );
    final tags = _serializeList(tagsList);
    final questionSet = _serializeJson(questionSetJson, true);
    final ffApiRequestBody = '''
{
  "title": "${title}",
  "description": "${description}",
  "tags": ${tags},
  "credReq": ${creditsRequired},
  "levelsReq": ${levelsReq},
  "maxLevelScore": ${maxLevelScore},
  "questionSet": ${questionSet},
  "status": "${status}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Assessment',
      apiUrl: '${baseUrl}/assessments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllAssessmentsAdminCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = SpiralReportsAdminAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get All Assessments Admin',
      apiUrl: '${baseUrl}/assessments',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? assessmentList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetSingleAssessmentAdminCall {
  Future<ApiCallResponse> call({
    String? assessmentID = '',
    String? accessToken = '',
  }) async {
    final baseUrl = SpiralReportsAdminAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Single Assessment Admin',
      apiUrl: '${baseUrl}/assessments/${assessmentID}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.title''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.description''',
      ));
  dynamic? assessmentData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  int? creditsRequired(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.credReq''',
      ));
  int? levelsRequired(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.levelsReq''',
      ));
  int? maxLevelScore(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.maxLevelScore''',
      ));
  String? createdUserID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.createdBy''',
      ));
  List? questionSet(dynamic response) => getJsonField(
        response,
        r'''$.data.questionSet''',
        true,
      ) as List?;
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.status''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.createdAt''',
      ));
  String? updatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.updatedAt''',
      ));
}

class UpdateAssessmentCall {
  Future<ApiCallResponse> call({
    String? assessmentID = '',
    String? title = '',
    String? description = '',
    List<String>? tagsList,
    int? credReq,
    int? levelsReq,
    int? maxLevelScore,
    dynamic? questionSetJson,
    String? status = '',
    String? accessToken = '',
  }) async {
    final baseUrl = SpiralReportsAdminAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );
    final tags = _serializeList(tagsList);
    final questionSet = _serializeJson(questionSetJson, true);
    final ffApiRequestBody = '''
{
  "title": "${title}",
  "description": "${description}",
  "tags": ${tags},
  "credReq": ${credReq},
  "levelsReq": ${levelsReq},
  "maxLevelScore": ${maxLevelScore},
  "questionSet": ${questionSet},
  "status": "${status}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Assessment',
      apiUrl: '${baseUrl}/assessments/${assessmentID}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.title''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.description''',
      ));
  dynamic? assessmentData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  int? creditsRequired(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.credReq''',
      ));
  int? levelsRequired(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.levelsReq''',
      ));
  int? maxLevelScore(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.maxLevelScore''',
      ));
  String? createdUserID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.createdBy''',
      ));
  List? questionSet(dynamic response) => getJsonField(
        response,
        r'''$.data.questionSet''',
        true,
      ) as List?;
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.status''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.createdAt''',
      ));
  String? updatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.updatedAt''',
      ));
}

class DeleteAssessmentCall {
  Future<ApiCallResponse> call({
    String? assessmentID = '',
    String? accessToken = '',
  }) async {
    final baseUrl = SpiralReportsAdminAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Assessment',
      apiUrl: '${baseUrl}/assessments/${assessmentID}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllEvaluationsAdminCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = SpiralReportsAdminAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get All Evaluations Admin',
      apiUrl: '${baseUrl}/evaluations',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? evaluationList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetSingleEvaluationAdminCall {
  Future<ApiCallResponse> call({
    String? evaluationID = '',
    String? accessToken = '',
  }) async {
    final baseUrl = SpiralReportsAdminAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Single Evaluation Admin',
      apiUrl: '${baseUrl}/evaluations/${evaluationID}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? evaluationData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? evaluationID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data._id''',
      ));
  String? assessementID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.assessmentId''',
      ));
  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.title''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.description''',
      ));
  int? creaditsUsed(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.creditsUsed''',
      ));
  int? levels(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.levels''',
      ));
  int? maxLevelScore(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.maxLevelScore''',
      ));
  String? assessedByUserID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.assessedBy''',
      ));
  List? evaluationResponse(dynamic response) => getJsonField(
        response,
        r'''$.data.response''',
        true,
      ) as List?;
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.createdAt''',
      ));
  String? updatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.updatedAt''',
      ));
}

class DeleteEvaluationAdminCall {
  Future<ApiCallResponse> call({
    String? evaluationID = '',
    String? accessToken = '',
  }) async {
    final baseUrl = SpiralReportsAdminAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Evaluation Admin',
      apiUrl: '${baseUrl}/evaluations/${evaluationID}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End SpiralReports Admin API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
