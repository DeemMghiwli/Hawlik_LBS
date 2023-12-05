import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HealthPlacesRecord extends FirestoreRecord {
  HealthPlacesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "match" field.
  int? _match;
  int get match => _match ?? 0;
  bool hasMatch() => _match != null;

  // "hasStairs" field.
  bool? _hasStairs;
  bool get hasStairs => _hasStairs ?? false;
  bool hasHasStairs() => _hasStairs != null;

  // "acceptsHealthInsurance" field.
  bool? _acceptsHealthInsurance;
  bool get acceptsHealthInsurance => _acceptsHealthInsurance ?? false;
  bool hasAcceptsHealthInsurance() => _acceptsHealthInsurance != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "PhoneNumber" field.
  int? _phoneNumber;
  int get phoneNumber => _phoneNumber ?? 0;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "BathroomForWheelchairs" field.
  bool? _bathroomForWheelchairs;
  bool get bathroomForWheelchairs => _bathroomForWheelchairs ?? false;
  bool hasBathroomForWheelchairs() => _bathroomForWheelchairs != null;

  // "placeImg" field.
  String? _placeImg;
  String get placeImg => _placeImg ?? '';
  bool hasPlaceImg() => _placeImg != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "HealthType" field.
  String? _healthType;
  String get healthType => _healthType ?? '';
  bool hasHealthType() => _healthType != null;

  // "placeId" field.
  String? _placeId;
  String get placeId => _placeId ?? '';
  bool hasPlaceId() => _placeId != null;

  // "stime" field.
  int? _stime;
  int get stime => _stime ?? 0;
  bool hasStime() => _stime != null;

  // "dtime" field.
  int? _dtime;
  int get dtime => _dtime ?? 0;
  bool hasDtime() => _dtime != null;

  // "distance" field.
  double? _distance;
  double get distance => _distance ?? 0.0;
  bool hasDistance() => _distance != null;

  void _initializeFields() {
    _match = castToType<int>(snapshotData['match']);
    _hasStairs = snapshotData['hasStairs'] as bool?;
    _acceptsHealthInsurance = snapshotData['acceptsHealthInsurance'] as bool?;
    _name = snapshotData['name'] as String?;
    _phoneNumber = castToType<int>(snapshotData['PhoneNumber']);
    _bathroomForWheelchairs = snapshotData['BathroomForWheelchairs'] as bool?;
    _placeImg = snapshotData['placeImg'] as String?;
    _location = snapshotData['Location'] as LatLng?;
    _description = snapshotData['Description'] as String?;
    _healthType = snapshotData['HealthType'] as String?;
    _placeId = snapshotData['placeId'] as String?;
    _stime = castToType<int>(snapshotData['stime']);
    _dtime = castToType<int>(snapshotData['dtime']);
    _distance = castToType<double>(snapshotData['distance']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('HealthPlaces');

  static Stream<HealthPlacesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HealthPlacesRecord.fromSnapshot(s));

  static Future<HealthPlacesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HealthPlacesRecord.fromSnapshot(s));

  static HealthPlacesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HealthPlacesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HealthPlacesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HealthPlacesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HealthPlacesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HealthPlacesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHealthPlacesRecordData({
  int? match,
  bool? hasStairs,
  bool? acceptsHealthInsurance,
  String? name,
  int? phoneNumber,
  bool? bathroomForWheelchairs,
  String? placeImg,
  LatLng? location,
  String? description,
  String? healthType,
  String? placeId,
  int? stime,
  int? dtime,
  double? distance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'match': match,
      'hasStairs': hasStairs,
      'acceptsHealthInsurance': acceptsHealthInsurance,
      'name': name,
      'PhoneNumber': phoneNumber,
      'BathroomForWheelchairs': bathroomForWheelchairs,
      'placeImg': placeImg,
      'Location': location,
      'Description': description,
      'HealthType': healthType,
      'placeId': placeId,
      'stime': stime,
      'dtime': dtime,
      'distance': distance,
    }.withoutNulls,
  );

  return firestoreData;
}

class HealthPlacesRecordDocumentEquality
    implements Equality<HealthPlacesRecord> {
  const HealthPlacesRecordDocumentEquality();

  @override
  bool equals(HealthPlacesRecord? e1, HealthPlacesRecord? e2) {
    return e1?.match == e2?.match &&
        e1?.hasStairs == e2?.hasStairs &&
        e1?.acceptsHealthInsurance == e2?.acceptsHealthInsurance &&
        e1?.name == e2?.name &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.bathroomForWheelchairs == e2?.bathroomForWheelchairs &&
        e1?.placeImg == e2?.placeImg &&
        e1?.location == e2?.location &&
        e1?.description == e2?.description &&
        e1?.healthType == e2?.healthType &&
        e1?.placeId == e2?.placeId &&
        e1?.stime == e2?.stime &&
        e1?.dtime == e2?.dtime &&
        e1?.distance == e2?.distance;
  }

  @override
  int hash(HealthPlacesRecord? e) => const ListEquality().hash([
        e?.match,
        e?.hasStairs,
        e?.acceptsHealthInsurance,
        e?.name,
        e?.phoneNumber,
        e?.bathroomForWheelchairs,
        e?.placeImg,
        e?.location,
        e?.description,
        e?.healthType,
        e?.placeId,
        e?.stime,
        e?.dtime,
        e?.distance
      ]);

  @override
  bool isValidKey(Object? o) => o is HealthPlacesRecord;
}
