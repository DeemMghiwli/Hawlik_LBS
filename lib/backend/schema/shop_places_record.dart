import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShopPlacesRecord extends FirestoreRecord {
  ShopPlacesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "cenma" field.
  bool? _cenma;
  bool get cenma => _cenma ?? false;
  bool hasCenma() => _cenma != null;

  // "musimepark" field.
  bool? _musimepark;
  bool get musimepark => _musimepark ?? false;
  bool hasMusimepark() => _musimepark != null;

  // "parkingN" field.
  bool? _parkingN;
  bool get parkingN => _parkingN ?? false;
  bool hasParkingN() => _parkingN != null;

  // "parkingDA" field.
  bool? _parkingDA;
  bool get parkingDA => _parkingDA ?? false;
  bool hasParkingDA() => _parkingDA != null;

  // "Supermarket" field.
  bool? _supermarket;
  bool get supermarket => _supermarket ?? false;
  bool hasSupermarket() => _supermarket != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "match" field.
  int? _match;
  int get match => _match ?? 0;
  bool hasMatch() => _match != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "test" field.
  int? _test;
  int get test => _test ?? 0;
  bool hasTest() => _test != null;

  // "OutdoorStore" field.
  bool? _outdoorStore;
  bool get outdoorStore => _outdoorStore ?? false;
  bool hasOutdoorStore() => _outdoorStore != null;

  // "FoodCor" field.
  bool? _foodCor;
  bool get foodCor => _foodCor ?? false;
  bool hasFoodCor() => _foodCor != null;

  // "stime" field.
  int? _stime;
  int get stime => _stime ?? 0;
  bool hasStime() => _stime != null;

  // "dtime" field.
  int? _dtime;
  int get dtime => _dtime ?? 0;
  bool hasDtime() => _dtime != null;

  // "StoreImage" field.
  String? _storeImage;
  String get storeImage => _storeImage ?? '';
  bool hasStoreImage() => _storeImage != null;

  // "distance" field.
  double? _distance;
  double get distance => _distance ?? 0.0;
  bool hasDistance() => _distance != null;

  // "AccsptChildren" field.
  bool? _accsptChildren;
  bool get accsptChildren => _accsptChildren ?? false;
  bool hasAccsptChildren() => _accsptChildren != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _cenma = snapshotData['cenma'] as bool?;
    _musimepark = snapshotData['musimepark'] as bool?;
    _parkingN = snapshotData['parkingN'] as bool?;
    _parkingDA = snapshotData['parkingDA'] as bool?;
    _supermarket = snapshotData['Supermarket'] as bool?;
    _id = castToType<int>(snapshotData['id']);
    _match = castToType<int>(snapshotData['match']);
    _location = snapshotData['location'] as LatLng?;
    _description = snapshotData['Description'] as String?;
    _test = castToType<int>(snapshotData['test']);
    _outdoorStore = snapshotData['OutdoorStore'] as bool?;
    _foodCor = snapshotData['FoodCor'] as bool?;
    _stime = castToType<int>(snapshotData['stime']);
    _dtime = castToType<int>(snapshotData['dtime']);
    _storeImage = snapshotData['StoreImage'] as String?;
    _distance = castToType<double>(snapshotData['distance']);
    _accsptChildren = snapshotData['AccsptChildren'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ShopPlaces');

  static Stream<ShopPlacesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShopPlacesRecord.fromSnapshot(s));

  static Future<ShopPlacesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShopPlacesRecord.fromSnapshot(s));

  static ShopPlacesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShopPlacesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShopPlacesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShopPlacesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShopPlacesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShopPlacesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShopPlacesRecordData({
  String? name,
  bool? cenma,
  bool? musimepark,
  bool? parkingN,
  bool? parkingDA,
  bool? supermarket,
  int? id,
  int? match,
  LatLng? location,
  String? description,
  int? test,
  bool? outdoorStore,
  bool? foodCor,
  int? stime,
  int? dtime,
  String? storeImage,
  double? distance,
  bool? accsptChildren,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'cenma': cenma,
      'musimepark': musimepark,
      'parkingN': parkingN,
      'parkingDA': parkingDA,
      'Supermarket': supermarket,
      'id': id,
      'match': match,
      'location': location,
      'Description': description,
      'test': test,
      'OutdoorStore': outdoorStore,
      'FoodCor': foodCor,
      'stime': stime,
      'dtime': dtime,
      'StoreImage': storeImage,
      'distance': distance,
      'AccsptChildren': accsptChildren,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShopPlacesRecordDocumentEquality implements Equality<ShopPlacesRecord> {
  const ShopPlacesRecordDocumentEquality();

  @override
  bool equals(ShopPlacesRecord? e1, ShopPlacesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.cenma == e2?.cenma &&
        e1?.musimepark == e2?.musimepark &&
        e1?.parkingN == e2?.parkingN &&
        e1?.parkingDA == e2?.parkingDA &&
        e1?.supermarket == e2?.supermarket &&
        e1?.id == e2?.id &&
        e1?.match == e2?.match &&
        e1?.location == e2?.location &&
        e1?.description == e2?.description &&
        e1?.test == e2?.test &&
        e1?.outdoorStore == e2?.outdoorStore &&
        e1?.foodCor == e2?.foodCor &&
        e1?.stime == e2?.stime &&
        e1?.dtime == e2?.dtime &&
        e1?.storeImage == e2?.storeImage &&
        e1?.distance == e2?.distance &&
        e1?.accsptChildren == e2?.accsptChildren;
  }

  @override
  int hash(ShopPlacesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.cenma,
        e?.musimepark,
        e?.parkingN,
        e?.parkingDA,
        e?.supermarket,
        e?.id,
        e?.match,
        e?.location,
        e?.description,
        e?.test,
        e?.outdoorStore,
        e?.foodCor,
        e?.stime,
        e?.dtime,
        e?.storeImage,
        e?.distance,
        e?.accsptChildren
      ]);

  @override
  bool isValidKey(Object? o) => o is ShopPlacesRecord;
}
