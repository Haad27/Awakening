import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class DailygoalsRecord extends FirestoreRecord {
  DailygoalsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "goals" field.
  String? _goals;
  String get goals => _goals ?? '';
  bool hasGoals() => _goals != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _goals = snapshotData['goals'] as String?;
    _time = snapshotData['time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('dailygoals')
          : FirebaseFirestore.instance.collectionGroup('dailygoals');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('dailygoals').doc(id);

  static Stream<DailygoalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DailygoalsRecord.fromSnapshot(s));

  static Future<DailygoalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DailygoalsRecord.fromSnapshot(s));

  static DailygoalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DailygoalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DailygoalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DailygoalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DailygoalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DailygoalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDailygoalsRecordData({
  String? goals,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'goals': goals,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class DailygoalsRecordDocumentEquality implements Equality<DailygoalsRecord> {
  const DailygoalsRecordDocumentEquality();

  @override
  bool equals(DailygoalsRecord? e1, DailygoalsRecord? e2) {
    return e1?.goals == e2?.goals && e1?.time == e2?.time;
  }

  @override
  int hash(DailygoalsRecord? e) =>
      const ListEquality().hash([e?.goals, e?.time]);

  @override
  bool isValidKey(Object? o) => o is DailygoalsRecord;
}
