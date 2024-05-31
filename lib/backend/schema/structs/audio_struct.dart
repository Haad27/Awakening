// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AudioStruct extends FFFirebaseStruct {
  AudioStruct({
    String? vm,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _vm = vm,
        super(firestoreUtilData);

  // "VM" field.
  String? _vm;
  String get vm => _vm ?? '';
  set vm(String? val) => _vm = val;
  bool hasVm() => _vm != null;

  static AudioStruct fromMap(Map<String, dynamic> data) => AudioStruct(
        vm: data['VM'] as String?,
      );

  static AudioStruct? maybeFromMap(dynamic data) =>
      data is Map ? AudioStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'VM': _vm,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'VM': serializeParam(
          _vm,
          ParamType.String,
        ),
      }.withoutNulls;

  static AudioStruct fromSerializableMap(Map<String, dynamic> data) =>
      AudioStruct(
        vm: deserializeParam(
          data['VM'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AudioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AudioStruct && vm == other.vm;
  }

  @override
  int get hashCode => const ListEquality().hash([vm]);
}

AudioStruct createAudioStruct({
  String? vm,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AudioStruct(
      vm: vm,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AudioStruct? updateAudioStruct(
  AudioStruct? audio, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    audio
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAudioStructData(
  Map<String, dynamic> firestoreData,
  AudioStruct? audio,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (audio == null) {
    return;
  }
  if (audio.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && audio.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final audioData = getAudioFirestoreData(audio, forFieldValue);
  final nestedData = audioData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = audio.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAudioFirestoreData(
  AudioStruct? audio, [
  bool forFieldValue = false,
]) {
  if (audio == null) {
    return {};
  }
  final firestoreData = mapToFirestore(audio.toMap());

  // Add any Firestore field values
  audio.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAudioListFirestoreData(
  List<AudioStruct>? audios,
) =>
    audios?.map((e) => getAudioFirestoreData(e, true)).toList() ?? [];
