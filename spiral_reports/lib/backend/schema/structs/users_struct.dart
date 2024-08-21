// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersStruct extends BaseStruct {
  UsersStruct({
    String? userID,
    String? firstName,
    String? middleName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? country,
    int? credits,
  })  : _userID = userID,
        _firstName = firstName,
        _middleName = middleName,
        _lastName = lastName,
        _email = email,
        _phoneNumber = phoneNumber,
        _country = country,
        _credits = credits;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  set userID(String? val) => _userID = val;

  bool hasUserID() => _userID != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "middleName" field.
  String? _middleName;
  String get middleName => _middleName ?? '';
  set middleName(String? val) => _middleName = val;

  bool hasMiddleName() => _middleName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "credits" field.
  int? _credits;
  int get credits => _credits ?? 0;
  set credits(int? val) => _credits = val;

  void incrementCredits(int amount) => credits = credits + amount;

  bool hasCredits() => _credits != null;

  static UsersStruct fromMap(Map<String, dynamic> data) => UsersStruct(
        userID: data['userID'] as String?,
        firstName: data['firstName'] as String?,
        middleName: data['middleName'] as String?,
        lastName: data['lastName'] as String?,
        email: data['email'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        country: data['country'] as String?,
        credits: castToType<int>(data['credits']),
      );

  static UsersStruct? maybeFromMap(dynamic data) =>
      data is Map ? UsersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'userID': _userID,
        'firstName': _firstName,
        'middleName': _middleName,
        'lastName': _lastName,
        'email': _email,
        'phoneNumber': _phoneNumber,
        'country': _country,
        'credits': _credits,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userID': serializeParam(
          _userID,
          ParamType.String,
        ),
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'middleName': serializeParam(
          _middleName,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'credits': serializeParam(
          _credits,
          ParamType.int,
        ),
      }.withoutNulls;

  static UsersStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsersStruct(
        userID: deserializeParam(
          data['userID'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        middleName: deserializeParam(
          data['middleName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        credits: deserializeParam(
          data['credits'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UsersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UsersStruct &&
        userID == other.userID &&
        firstName == other.firstName &&
        middleName == other.middleName &&
        lastName == other.lastName &&
        email == other.email &&
        phoneNumber == other.phoneNumber &&
        country == other.country &&
        credits == other.credits;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userID,
        firstName,
        middleName,
        lastName,
        email,
        phoneNumber,
        country,
        credits
      ]);
}

UsersStruct createUsersStruct({
  String? userID,
  String? firstName,
  String? middleName,
  String? lastName,
  String? email,
  String? phoneNumber,
  String? country,
  int? credits,
}) =>
    UsersStruct(
      userID: userID,
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      country: country,
      credits: credits,
    );
