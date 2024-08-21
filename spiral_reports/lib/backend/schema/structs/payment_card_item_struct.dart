// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentCardItemStruct extends BaseStruct {
  PaymentCardItemStruct({
    String? name,
    int? cardNumber,
    DateTime? expiry,
    int? cvv,
  })  : _name = name,
        _cardNumber = cardNumber,
        _expiry = expiry,
        _cvv = cvv;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "cardNumber" field.
  int? _cardNumber;
  int get cardNumber => _cardNumber ?? 0;
  set cardNumber(int? val) => _cardNumber = val;

  void incrementCardNumber(int amount) => cardNumber = cardNumber + amount;

  bool hasCardNumber() => _cardNumber != null;

  // "expiry" field.
  DateTime? _expiry;
  DateTime? get expiry => _expiry;
  set expiry(DateTime? val) => _expiry = val;

  bool hasExpiry() => _expiry != null;

  // "cvv" field.
  int? _cvv;
  int get cvv => _cvv ?? 0;
  set cvv(int? val) => _cvv = val;

  void incrementCvv(int amount) => cvv = cvv + amount;

  bool hasCvv() => _cvv != null;

  static PaymentCardItemStruct fromMap(Map<String, dynamic> data) =>
      PaymentCardItemStruct(
        name: data['name'] as String?,
        cardNumber: castToType<int>(data['cardNumber']),
        expiry: data['expiry'] as DateTime?,
        cvv: castToType<int>(data['cvv']),
      );

  static PaymentCardItemStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentCardItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'cardNumber': _cardNumber,
        'expiry': _expiry,
        'cvv': _cvv,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'cardNumber': serializeParam(
          _cardNumber,
          ParamType.int,
        ),
        'expiry': serializeParam(
          _expiry,
          ParamType.DateTime,
        ),
        'cvv': serializeParam(
          _cvv,
          ParamType.int,
        ),
      }.withoutNulls;

  static PaymentCardItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaymentCardItemStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        cardNumber: deserializeParam(
          data['cardNumber'],
          ParamType.int,
          false,
        ),
        expiry: deserializeParam(
          data['expiry'],
          ParamType.DateTime,
          false,
        ),
        cvv: deserializeParam(
          data['cvv'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PaymentCardItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentCardItemStruct &&
        name == other.name &&
        cardNumber == other.cardNumber &&
        expiry == other.expiry &&
        cvv == other.cvv;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, cardNumber, expiry, cvv]);
}

PaymentCardItemStruct createPaymentCardItemStruct({
  String? name,
  int? cardNumber,
  DateTime? expiry,
  int? cvv,
}) =>
    PaymentCardItemStruct(
      name: name,
      cardNumber: cardNumber,
      expiry: expiry,
      cvv: cvv,
    );
