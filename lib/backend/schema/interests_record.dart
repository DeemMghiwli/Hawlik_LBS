import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InterestsRecord extends FirestoreRecord {
  InterestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Pref_Playground" field.
  bool? _prefPlayground;
  bool get prefPlayground => _prefPlayground ?? false;
  bool hasPrefPlayground() => _prefPlayground != null;

  // "Pref_Cinema" field.
  bool? _prefCinema;
  bool get prefCinema => _prefCinema ?? false;
  bool hasPrefCinema() => _prefCinema != null;

  // "Pref_StreetMrakets" field.
  bool? _prefStreetMrakets;
  bool get prefStreetMrakets => _prefStreetMrakets ?? false;
  bool hasPrefStreetMrakets() => _prefStreetMrakets != null;

  // "Pref_FoodRetailers" field.
  bool? _prefFoodRetailers;
  bool get prefFoodRetailers => _prefFoodRetailers ?? false;
  bool hasPrefFoodRetailers() => _prefFoodRetailers != null;

  // "Pref_FastService" field.
  bool? _prefFastService;
  bool get prefFastService => _prefFastService ?? false;
  bool hasPrefFastService() => _prefFastService != null;

  // "Pref_DriveThrow" field.
  bool? _prefDriveThrow;
  bool get prefDriveThrow => _prefDriveThrow ?? false;
  bool hasPrefDriveThrow() => _prefDriveThrow != null;

  // "Pref_Reservation" field.
  bool? _prefReservation;
  bool get prefReservation => _prefReservation ?? false;
  bool hasPrefReservation() => _prefReservation != null;

  // "Pref_CozyAtmosphere" field.
  bool? _prefCozyAtmosphere;
  bool get prefCozyAtmosphere => _prefCozyAtmosphere ?? false;
  bool hasPrefCozyAtmosphere() => _prefCozyAtmosphere != null;

  // "Pref_NormalParking" field.
  bool? _prefNormalParking;
  bool get prefNormalParking => _prefNormalParking ?? false;
  bool hasPrefNormalParking() => _prefNormalParking != null;

  // "Pref_AcceptHealthInsurance" field.
  bool? _prefAcceptHealthInsurance;
  bool get prefAcceptHealthInsurance => _prefAcceptHealthInsurance ?? false;
  bool hasPrefAcceptHealthInsurance() => _prefAcceptHealthInsurance != null;

  // "userid" field.
  DocumentReference? _userid;
  DocumentReference? get userid => _userid;
  bool hasUserid() => _userid != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _prefPlayground = snapshotData['Pref_Playground'] as bool?;
    _prefCinema = snapshotData['Pref_Cinema'] as bool?;
    _prefStreetMrakets = snapshotData['Pref_StreetMrakets'] as bool?;
    _prefFoodRetailers = snapshotData['Pref_FoodRetailers'] as bool?;
    _prefFastService = snapshotData['Pref_FastService'] as bool?;
    _prefDriveThrow = snapshotData['Pref_DriveThrow'] as bool?;
    _prefReservation = snapshotData['Pref_Reservation'] as bool?;
    _prefCozyAtmosphere = snapshotData['Pref_CozyAtmosphere'] as bool?;
    _prefNormalParking = snapshotData['Pref_NormalParking'] as bool?;
    _prefAcceptHealthInsurance =
        snapshotData['Pref_AcceptHealthInsurance'] as bool?;
    _userid = snapshotData['userid'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Interests')
          : FirebaseFirestore.instance.collectionGroup('Interests');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Interests').doc();

  static Stream<InterestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InterestsRecord.fromSnapshot(s));

  static Future<InterestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InterestsRecord.fromSnapshot(s));

  static InterestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InterestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InterestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InterestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InterestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InterestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInterestsRecordData({
  bool? prefPlayground,
  bool? prefCinema,
  bool? prefStreetMrakets,
  bool? prefFoodRetailers,
  bool? prefFastService,
  bool? prefDriveThrow,
  bool? prefReservation,
  bool? prefCozyAtmosphere,
  bool? prefNormalParking,
  bool? prefAcceptHealthInsurance,
  DocumentReference? userid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Pref_Playground': prefPlayground,
      'Pref_Cinema': prefCinema,
      'Pref_StreetMrakets': prefStreetMrakets,
      'Pref_FoodRetailers': prefFoodRetailers,
      'Pref_FastService': prefFastService,
      'Pref_DriveThrow': prefDriveThrow,
      'Pref_Reservation': prefReservation,
      'Pref_CozyAtmosphere': prefCozyAtmosphere,
      'Pref_NormalParking': prefNormalParking,
      'Pref_AcceptHealthInsurance': prefAcceptHealthInsurance,
      'userid': userid,
    }.withoutNulls,
  );

  return firestoreData;
}

class InterestsRecordDocumentEquality implements Equality<InterestsRecord> {
  const InterestsRecordDocumentEquality();

  @override
  bool equals(InterestsRecord? e1, InterestsRecord? e2) {
    return e1?.prefPlayground == e2?.prefPlayground &&
        e1?.prefCinema == e2?.prefCinema &&
        e1?.prefStreetMrakets == e2?.prefStreetMrakets &&
        e1?.prefFoodRetailers == e2?.prefFoodRetailers &&
        e1?.prefFastService == e2?.prefFastService &&
        e1?.prefDriveThrow == e2?.prefDriveThrow &&
        e1?.prefReservation == e2?.prefReservation &&
        e1?.prefCozyAtmosphere == e2?.prefCozyAtmosphere &&
        e1?.prefNormalParking == e2?.prefNormalParking &&
        e1?.prefAcceptHealthInsurance == e2?.prefAcceptHealthInsurance &&
        e1?.userid == e2?.userid;
  }

  @override
  int hash(InterestsRecord? e) => const ListEquality().hash([
        e?.prefPlayground,
        e?.prefCinema,
        e?.prefStreetMrakets,
        e?.prefFoodRetailers,
        e?.prefFastService,
        e?.prefDriveThrow,
        e?.prefReservation,
        e?.prefCozyAtmosphere,
        e?.prefNormalParking,
        e?.prefAcceptHealthInsurance,
        e?.userid
      ]);

  @override
  bool isValidKey(Object? o) => o is InterestsRecord;
}
