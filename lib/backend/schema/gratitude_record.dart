import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GratitudeRecord extends FirestoreRecord {
  GratitudeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "gratitude" field.
  String? _gratitude;
  String get gratitude => _gratitude ?? '';
  bool hasGratitude() => _gratitude != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _gratitude = snapshotData['gratitude'] as String?;
    _time = snapshotData['time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('gratitude')
          : FirebaseFirestore.instance.collectionGroup('gratitude');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('gratitude').doc(id);

  static Stream<GratitudeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GratitudeRecord.fromSnapshot(s));

  static Future<GratitudeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GratitudeRecord.fromSnapshot(s));

  static GratitudeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GratitudeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GratitudeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GratitudeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GratitudeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GratitudeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGratitudeRecordData({
  String? gratitude,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'gratitude': gratitude,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class GratitudeRecordDocumentEquality implements Equality<GratitudeRecord> {
  const GratitudeRecordDocumentEquality();

  @override
  bool equals(GratitudeRecord? e1, GratitudeRecord? e2) {
    return e1?.gratitude == e2?.gratitude && e1?.time == e2?.time;
  }

  @override
  int hash(GratitudeRecord? e) =>
      const ListEquality().hash([e?.gratitude, e?.time]);

  @override
  bool isValidKey(Object? o) => o is GratitudeRecord;
}
