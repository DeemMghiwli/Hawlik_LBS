import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodRecord extends FirestoreRecord {
  FoodRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "match" field.
  int? _match;
  int get match => _match ?? 0;
  bool hasMatch() => _match != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "hasReservation" field.
  bool? _hasReservation;
  bool get hasReservation => _hasReservation ?? false;
  bool hasHasReservation() => _hasReservation != null;

  // "hasDriveThru" field.
  bool? _hasDriveThru;
  bool get hasDriveThru => _hasDriveThru ?? false;
  bool hasHasDriveThru() => _hasDriveThru != null;

  // "hasFastService" field.
  bool? _hasFastService;
  bool get hasFastService => _hasFastService ?? false;
  bool hasHasFastService() => _hasFastService != null;

  // "PhoneNumber" field.
  int? _phoneNumber;
  int get phoneNumber => _phoneNumber ?? 0;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "PlaceImg" field.
  String? _placeImg;
  String get placeImg => _placeImg ?? '';
  bool hasPlaceImg() => _placeImg != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "foodType" field.
  String? _foodType;
  String get foodType => _foodType ?? '';
  bool hasFoodType() => _foodType != null;

  // "Vegetarianoptions" field.
  bool? _vegetarianoptions;
  bool get vegetarianoptions => _vegetarianoptions ?? false;
  bool hasVegetarianoptions() => _vegetarianoptions != null;

  // "SuitableForWheelchairs" field.
  bool? _suitableForWheelchairs;
  bool get suitableForWheelchairs => _suitableForWheelchairs ?? false;
  bool hasSuitableForWheelchairs() => _suitableForWheelchairs != null;

  // "SuitableForChildren" field.
  bool? _suitableForChildren;
  bool get suitableForChildren => _suitableForChildren ?? false;
  bool hasSuitableForChildren() => _suitableForChildren != null;

  // "CozyAtmosphere" field.
  bool? _cozyAtmosphere;
  bool get cozyAtmosphere => _cozyAtmosphere ?? false;
  bool hasCozyAtmosphere() => _cozyAtmosphere != null;

  // "test" field.
  int? _test;
  int get test => _test ?? 0;
  bool hasTest() => _test != null;

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
    _name = snapshotData['name'] as String?;
    _match = castToType<int>(snapshotData['match']);
    _location = snapshotData['location'] as LatLng?;
    _hasReservation = snapshotData['hasReservation'] as bool?;
    _hasDriveThru = snapshotData['hasDriveThru'] as bool?;
    _hasFastService = snapshotData['hasFastService'] as bool?;
    _phoneNumber = castToType<int>(snapshotData['PhoneNumber']);
    _placeImg = snapshotData['PlaceImg'] as String?;
    _description = snapshotData['Description'] as String?;
    _foodType = snapshotData['foodType'] as String?;
    _vegetarianoptions = snapshotData['Vegetarianoptions'] as bool?;
    _suitableForWheelchairs = snapshotData['SuitableForWheelchairs'] as bool?;
    _suitableForChildren = snapshotData['SuitableForChildren'] as bool?;
    _cozyAtmosphere = snapshotData['CozyAtmosphere'] as bool?;
    _test = castToType<int>(snapshotData['test']);
    _stime = castToType<int>(snapshotData['stime']);
    _dtime = castToType<int>(snapshotData['dtime']);
    _distance = castToType<double>(snapshotData['distance']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('food');

  static Stream<FoodRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodRecord.fromSnapshot(s));

  static Future<FoodRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodRecord.fromSnapshot(s));

  static FoodRecord fromSnapshot(DocumentSnapshot snapshot) => FoodRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoodRecordData({
  String? name,
  int? match,
  LatLng? location,
  bool? hasReservation,
  bool? hasDriveThru,
  bool? hasFastService,
  int? phoneNumber,
  String? placeImg,
  String? description,
  String? foodType,
  bool? vegetarianoptions,
  bool? suitableForWheelchairs,
  bool? suitableForChildren,
  bool? cozyAtmosphere,
  int? test,
  int? stime,
  int? dtime,
  double? distance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'match': match,
      'location': location,
      'hasReservation': hasReservation,
      'hasDriveThru': hasDriveThru,
      'hasFastService': hasFastService,
      'PhoneNumber': phoneNumber,
      'PlaceImg': placeImg,
      'Description': description,
      'foodType': foodType,
      'Vegetarianoptions': vegetarianoptions,
      'SuitableForWheelchairs': suitableForWheelchairs,
      'SuitableForChildren': suitableForChildren,
      'CozyAtmosphere': cozyAtmosphere,
      'test': test,
      'stime': stime,
      'dtime': dtime,
      'distance': distance,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodRecordDocumentEquality implements Equality<FoodRecord> {
  const FoodRecordDocumentEquality();

  @override
  bool equals(FoodRecord? e1, FoodRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.match == e2?.match &&
        e1?.location == e2?.location &&
        e1?.hasReservation == e2?.hasReservation &&
        e1?.hasDriveThru == e2?.hasDriveThru &&
        e1?.hasFastService == e2?.hasFastService &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.placeImg == e2?.placeImg &&
        e1?.description == e2?.description &&
        e1?.foodType == e2?.foodType &&
        e1?.vegetarianoptions == e2?.vegetarianoptions &&
        e1?.suitableForWheelchairs == e2?.suitableForWheelchairs &&
        e1?.suitableForChildren == e2?.suitableForChildren &&
        e1?.cozyAtmosphere == e2?.cozyAtmosphere &&
        e1?.test == e2?.test &&
        e1?.stime == e2?.stime &&
        e1?.dtime == e2?.dtime &&
        e1?.distance == e2?.distance;
  }

  @override
  int hash(FoodRecord? e) => const ListEquality().hash([
        e?.name,
        e?.match,
        e?.location,
        e?.hasReservation,
        e?.hasDriveThru,
        e?.hasFastService,
        e?.phoneNumber,
        e?.placeImg,
        e?.description,
        e?.foodType,
        e?.vegetarianoptions,
        e?.suitableForWheelchairs,
        e?.suitableForChildren,
        e?.cozyAtmosphere,
        e?.test,
        e?.stime,
        e?.dtime,
        e?.distance
      ]);

  @override
  bool isValidKey(Object? o) => o is FoodRecord;
}
