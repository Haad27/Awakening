import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsermainpagerecordRecord extends FirestoreRecord {
  UsermainpagerecordRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "DailyGoals" field.
  String? _dailyGoals;
  String get dailyGoals => _dailyGoals ?? '';
  bool hasDailyGoals() => _dailyGoals != null;

  // "gratitude" field.
  String? _gratitude;
  String get gratitude => _gratitude ?? '';
  bool hasGratitude() => _gratitude != null;

  // "weeklyvalue" field.
  double? _weeklyvalue;
  double get weeklyvalue => _weeklyvalue ?? 0.0;
  bool hasWeeklyvalue() => _weeklyvalue != null;

  // "dailyvalue" field.
  double? _dailyvalue;
  double get dailyvalue => _dailyvalue ?? 0.0;
  bool hasDailyvalue() => _dailyvalue != null;

  // "totalvalue" field.
  double? _totalvalue;
  double get totalvalue => _totalvalue ?? 0.0;
  bool hasTotalvalue() => _totalvalue != null;

  // "points" field.
  double? _points;
  double get points => _points ?? 0.0;
  bool hasPoints() => _points != null;

  void _initializeFields() {
    _dailyGoals = snapshotData['DailyGoals'] as String?;
    _gratitude = snapshotData['gratitude'] as String?;
    _weeklyvalue = castToType<double>(snapshotData['weeklyvalue']);
    _dailyvalue = castToType<double>(snapshotData['dailyvalue']);
    _totalvalue = castToType<double>(snapshotData['totalvalue']);
    _points = castToType<double>(snapshotData['points']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usermainpagerecord');

  static Stream<UsermainpagerecordRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsermainpagerecordRecord.fromSnapshot(s));

  static Future<UsermainpagerecordRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UsermainpagerecordRecord.fromSnapshot(s));

  static UsermainpagerecordRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsermainpagerecordRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsermainpagerecordRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsermainpagerecordRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsermainpagerecordRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsermainpagerecordRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsermainpagerecordRecordData({
  String? dailyGoals,
  String? gratitude,
  double? weeklyvalue,
  double? dailyvalue,
  double? totalvalue,
  double? points,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'DailyGoals': dailyGoals,
      'gratitude': gratitude,
      'weeklyvalue': weeklyvalue,
      'dailyvalue': dailyvalue,
      'totalvalue': totalvalue,
      'points': points,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsermainpagerecordRecordDocumentEquality
    implements Equality<UsermainpagerecordRecord> {
  const UsermainpagerecordRecordDocumentEquality();

  @override
  bool equals(UsermainpagerecordRecord? e1, UsermainpagerecordRecord? e2) {
    return e1?.dailyGoals == e2?.dailyGoals &&
        e1?.gratitude == e2?.gratitude &&
        e1?.weeklyvalue == e2?.weeklyvalue &&
        e1?.dailyvalue == e2?.dailyvalue &&
        e1?.totalvalue == e2?.totalvalue &&
        e1?.points == e2?.points;
  }

  @override
  int hash(UsermainpagerecordRecord? e) => const ListEquality().hash([
        e?.dailyGoals,
        e?.gratitude,
        e?.weeklyvalue,
        e?.dailyvalue,
        e?.totalvalue,
        e?.points
      ]);

  @override
  bool isValidKey(Object? o) => o is UsermainpagerecordRecord;
}
