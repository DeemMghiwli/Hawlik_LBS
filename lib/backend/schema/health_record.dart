import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HealthRecord extends FirestoreRecord {
  HealthRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "has_disability" field.
  bool? _hasDisability;
  bool get hasDisability => _hasDisability ?? false;
  bool hasHasDisability() => _hasDisability != null;

  // "has_Disease" field.
  bool? _hasDisease;
  bool get hasDisease => _hasDisease ?? false;
  bool hasHasDisease() => _hasDisease != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _hasDisability = snapshotData['has_disability'] as bool?;
    _hasDisease = snapshotData['has_Disease'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('health')
          : FirebaseFirestore.instance.collectionGroup('health');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('health').doc();

  static Stream<HealthRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HealthRecord.fromSnapshot(s));

  static Future<HealthRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HealthRecord.fromSnapshot(s));

  static HealthRecord fromSnapshot(DocumentSnapshot snapshot) => HealthRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HealthRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HealthRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HealthRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HealthRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHealthRecordData({
  String? uid,
  bool? hasDisability,
  bool? hasDisease,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'has_disability': hasDisability,
      'has_Disease': hasDisease,
    }.withoutNulls,
  );

  return firestoreData;
}

class HealthRecordDocumentEquality implements Equality<HealthRecord> {
  const HealthRecordDocumentEquality();

  @override
  bool equals(HealthRecord? e1, HealthRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.hasDisability == e2?.hasDisability &&
        e1?.hasDisease == e2?.hasDisease;
  }

  @override
  int hash(HealthRecord? e) =>
      const ListEquality().hash([e?.uid, e?.hasDisability, e?.hasDisease]);

  @override
  bool isValidKey(Object? o) => o is HealthRecord;
}
