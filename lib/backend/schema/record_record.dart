import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecordRecord extends FirestoreRecord {
  RecordRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  bool hasUser() => _user != null;

  // "dailygoals" field.
  String? _dailygoals;
  String get dailygoals => _dailygoals ?? '';
  bool hasDailygoals() => _dailygoals != null;

  // "gratitude" field.
  String? _gratitude;
  String get gratitude => _gratitude ?? '';
  bool hasGratitude() => _gratitude != null;

  // "record" field.
  int? _record;
  int get record => _record ?? 0;
  bool hasRecord() => _record != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as String?;
    _dailygoals = snapshotData['dailygoals'] as String?;
    _gratitude = snapshotData['gratitude'] as String?;
    _record = castToType<int>(snapshotData['record']);
    _data = snapshotData['data'] as DateTime?;
    _notes = snapshotData['notes'] as String?;
    _time = snapshotData['time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('record')
          : FirebaseFirestore.instance.collectionGroup('record');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('record').doc(id);

  static Stream<RecordRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecordRecord.fromSnapshot(s));

  static Future<RecordRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecordRecord.fromSnapshot(s));

  static RecordRecord fromSnapshot(DocumentSnapshot snapshot) => RecordRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecordRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecordRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecordRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecordRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecordRecordData({
  String? user,
  String? dailygoals,
  String? gratitude,
  int? record,
  DateTime? data,
  String? notes,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'dailygoals': dailygoals,
      'gratitude': gratitude,
      'record': record,
      'data': data,
      'notes': notes,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecordRecordDocumentEquality implements Equality<RecordRecord> {
  const RecordRecordDocumentEquality();

  @override
  bool equals(RecordRecord? e1, RecordRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.dailygoals == e2?.dailygoals &&
        e1?.gratitude == e2?.gratitude &&
        e1?.record == e2?.record &&
        e1?.data == e2?.data &&
        e1?.notes == e2?.notes &&
        e1?.time == e2?.time;
  }

  @override
  int hash(RecordRecord? e) => const ListEquality().hash([
        e?.user,
        e?.dailygoals,
        e?.gratitude,
        e?.record,
        e?.data,
        e?.notes,
        e?.time
      ]);

  @override
  bool isValidKey(Object? o) => o is RecordRecord;
}
