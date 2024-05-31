// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PhoneRecordStruct extends FFFirebaseStruct {
  PhoneRecordStruct({
    String? name,
    String? phone,
    String? email,
    String? avator,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _phone = phone,
        _email = email,
        _avator = avator,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;
  bool hasPhone() => _phone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "avator" field.
  String? _avator;
  String get avator => _avator ?? '';
  set avator(String? val) => _avator = val;
  bool hasAvator() => _avator != null;

  static PhoneRecordStruct fromMap(Map<String, dynamic> data) =>
      PhoneRecordStruct(
        name: data['name'] as String?,
        phone: data['phone'] as String?,
        email: data['email'] as String?,
        avator: data['avator'] as String?,
      );

  static PhoneRecordStruct? maybeFromMap(dynamic data) => data is Map
      ? PhoneRecordStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'phone': _phone,
        'email': _email,
        'avator': _avator,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'avator': serializeParam(
          _avator,
          ParamType.String,
        ),
      }.withoutNulls;

  static PhoneRecordStruct fromSerializableMap(Map<String, dynamic> data) =>
      PhoneRecordStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        avator: deserializeParam(
          data['avator'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PhoneRecordStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PhoneRecordStruct &&
        name == other.name &&
        phone == other.phone &&
        email == other.email &&
        avator == other.avator;
  }

  @override
  int get hashCode => const ListEquality().hash([name, phone, email, avator]);
}

PhoneRecordStruct createPhoneRecordStruct({
  String? name,
  String? phone,
  String? email,
  String? avator,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PhoneRecordStruct(
      name: name,
      phone: phone,
      email: email,
      avator: avator,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PhoneRecordStruct? updatePhoneRecordStruct(
  PhoneRecordStruct? phoneRecord, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    phoneRecord
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPhoneRecordStructData(
  Map<String, dynamic> firestoreData,
  PhoneRecordStruct? phoneRecord,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (phoneRecord == null) {
    return;
  }
  if (phoneRecord.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && phoneRecord.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final phoneRecordData =
      getPhoneRecordFirestoreData(phoneRecord, forFieldValue);
  final nestedData =
      phoneRecordData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = phoneRecord.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPhoneRecordFirestoreData(
  PhoneRecordStruct? phoneRecord, [
  bool forFieldValue = false,
]) {
  if (phoneRecord == null) {
    return {};
  }
  final firestoreData = mapToFirestore(phoneRecord.toMap());

  // Add any Firestore field values
  phoneRecord.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPhoneRecordListFirestoreData(
  List<PhoneRecordStruct>? phoneRecords,
) =>
    phoneRecords?.map((e) => getPhoneRecordFirestoreData(e, true)).toList() ??
    [];
