import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "pref_Parking" field.
  bool? _prefParking;
  bool get prefParking => _prefParking ?? false;
  bool hasPrefParking() => _prefParking != null;

  // "pref_parking_4diesabites" field.
  bool? _prefParking4diesabites;
  bool get prefParking4diesabites => _prefParking4diesabites ?? false;
  bool hasPrefParking4diesabites() => _prefParking4diesabites != null;

  // "pref_moves" field.
  bool? _prefMoves;
  bool get prefMoves => _prefMoves ?? false;
  bool hasPrefMoves() => _prefMoves != null;

  // "perf_AmusPark" field.
  bool? _perfAmusPark;
  bool get perfAmusPark => _perfAmusPark ?? false;
  bool hasPerfAmusPark() => _perfAmusPark != null;

  // "perf_SuperMarket" field.
  bool? _perfSuperMarket;
  bool get perfSuperMarket => _perfSuperMarket ?? false;
  bool hasPerfSuperMarket() => _perfSuperMarket != null;

  // "perf_restursntcaffe" field.
  bool? _perfRestursntcaffe;
  bool get perfRestursntcaffe => _perfRestursntcaffe ?? false;
  bool hasPerfRestursntcaffe() => _perfRestursntcaffe != null;

  // "hasDisability" field.
  bool? _hasDisability;
  bool get hasDisability => _hasDisability ?? false;
  bool hasHasDisability() => _hasDisability != null;

  // "hasHealthInsurance" field.
  bool? _hasHealthInsurance;
  bool get hasHealthInsurance => _hasHealthInsurance ?? false;
  bool hasHasHealthInsurance() => _hasHealthInsurance != null;

  // "userLocation" field.
  LatLng? _userLocation;
  LatLng? get userLocation => _userLocation;
  bool hasUserLocation() => _userLocation != null;

  // "pref_fastService" field.
  bool? _prefFastService;
  bool get prefFastService => _prefFastService ?? false;
  bool hasPrefFastService() => _prefFastService != null;

  // "pref_driveThru" field.
  bool? _prefDriveThru;
  bool get prefDriveThru => _prefDriveThru ?? false;
  bool hasPrefDriveThru() => _prefDriveThru != null;

  // "pref_reservation" field.
  bool? _prefReservation;
  bool get prefReservation => _prefReservation ?? false;
  bool hasPrefReservation() => _prefReservation != null;

  // "pref_CozyAtmosphere" field.
  bool? _prefCozyAtmosphere;
  bool get prefCozyAtmosphere => _prefCozyAtmosphere ?? false;
  bool hasPrefCozyAtmosphere() => _prefCozyAtmosphere != null;

  // "Vegetarian" field.
  bool? _vegetarian;
  bool get vegetarian => _vegetarian ?? false;
  bool hasVegetarian() => _vegetarian != null;

  // "hasChildren" field.
  bool? _hasChildren;
  bool get hasChildren => _hasChildren ?? false;
  bool hasHasChildren() => _hasChildren != null;

  // "Reservation" field.
  bool? _reservation;
  bool get reservation => _reservation ?? false;
  bool hasReservation() => _reservation != null;

  // "fastService" field.
  bool? _fastService;
  bool get fastService => _fastService ?? false;
  bool hasFastService() => _fastService != null;

  // "driveThru" field.
  bool? _driveThru;
  bool get driveThru => _driveThru ?? false;
  bool hasDriveThru() => _driveThru != null;

  // "DisabilitiesPark" field.
  bool? _disabilitiesPark;
  bool get disabilitiesPark => _disabilitiesPark ?? false;
  bool hasDisabilitiesPark() => _disabilitiesPark != null;

  // "perf_Movies" field.
  bool? _perfMovies;
  bool get perfMovies => _perfMovies ?? false;
  bool hasPerfMovies() => _perfMovies != null;

  // "pref_OutDoorStore" field.
  bool? _prefOutDoorStore;
  bool get prefOutDoorStore => _prefOutDoorStore ?? false;
  bool hasPrefOutDoorStore() => _prefOutDoorStore != null;

  // "prefFoodCort" field.
  bool? _prefFoodCort;
  bool get prefFoodCort => _prefFoodCort ?? false;
  bool hasPrefFoodCort() => _prefFoodCort != null;

  // "schedule" field.
  DateTime? _schedule;
  DateTime? get schedule => _schedule;
  bool hasSchedule() => _schedule != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _prefParking = snapshotData['pref_Parking'] as bool?;
    _prefParking4diesabites = snapshotData['pref_parking_4diesabites'] as bool?;
    _prefMoves = snapshotData['pref_moves'] as bool?;
    _perfAmusPark = snapshotData['perf_AmusPark'] as bool?;
    _perfSuperMarket = snapshotData['perf_SuperMarket'] as bool?;
    _perfRestursntcaffe = snapshotData['perf_restursntcaffe'] as bool?;
    _hasDisability = snapshotData['hasDisability'] as bool?;
    _hasHealthInsurance = snapshotData['hasHealthInsurance'] as bool?;
    _userLocation = snapshotData['userLocation'] as LatLng?;
    _prefFastService = snapshotData['pref_fastService'] as bool?;
    _prefDriveThru = snapshotData['pref_driveThru'] as bool?;
    _prefReservation = snapshotData['pref_reservation'] as bool?;
    _prefCozyAtmosphere = snapshotData['pref_CozyAtmosphere'] as bool?;
    _vegetarian = snapshotData['Vegetarian'] as bool?;
    _hasChildren = snapshotData['hasChildren'] as bool?;
    _reservation = snapshotData['Reservation'] as bool?;
    _fastService = snapshotData['fastService'] as bool?;
    _driveThru = snapshotData['driveThru'] as bool?;
    _disabilitiesPark = snapshotData['DisabilitiesPark'] as bool?;
    _perfMovies = snapshotData['perf_Movies'] as bool?;
    _prefOutDoorStore = snapshotData['pref_OutDoorStore'] as bool?;
    _prefFoodCort = snapshotData['prefFoodCort'] as bool?;
    _schedule = snapshotData['schedule'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? prefParking,
  bool? prefParking4diesabites,
  bool? prefMoves,
  bool? perfAmusPark,
  bool? perfSuperMarket,
  bool? perfRestursntcaffe,
  bool? hasDisability,
  bool? hasHealthInsurance,
  LatLng? userLocation,
  bool? prefFastService,
  bool? prefDriveThru,
  bool? prefReservation,
  bool? prefCozyAtmosphere,
  bool? vegetarian,
  bool? hasChildren,
  bool? reservation,
  bool? fastService,
  bool? driveThru,
  bool? disabilitiesPark,
  bool? perfMovies,
  bool? prefOutDoorStore,
  bool? prefFoodCort,
  DateTime? schedule,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'pref_Parking': prefParking,
      'pref_parking_4diesabites': prefParking4diesabites,
      'pref_moves': prefMoves,
      'perf_AmusPark': perfAmusPark,
      'perf_SuperMarket': perfSuperMarket,
      'perf_restursntcaffe': perfRestursntcaffe,
      'hasDisability': hasDisability,
      'hasHealthInsurance': hasHealthInsurance,
      'userLocation': userLocation,
      'pref_fastService': prefFastService,
      'pref_driveThru': prefDriveThru,
      'pref_reservation': prefReservation,
      'pref_CozyAtmosphere': prefCozyAtmosphere,
      'Vegetarian': vegetarian,
      'hasChildren': hasChildren,
      'Reservation': reservation,
      'fastService': fastService,
      'driveThru': driveThru,
      'DisabilitiesPark': disabilitiesPark,
      'perf_Movies': perfMovies,
      'pref_OutDoorStore': prefOutDoorStore,
      'prefFoodCort': prefFoodCort,
      'schedule': schedule,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.prefParking == e2?.prefParking &&
        e1?.prefParking4diesabites == e2?.prefParking4diesabites &&
        e1?.prefMoves == e2?.prefMoves &&
        e1?.perfAmusPark == e2?.perfAmusPark &&
        e1?.perfSuperMarket == e2?.perfSuperMarket &&
        e1?.perfRestursntcaffe == e2?.perfRestursntcaffe &&
        e1?.hasDisability == e2?.hasDisability &&
        e1?.hasHealthInsurance == e2?.hasHealthInsurance &&
        e1?.userLocation == e2?.userLocation &&
        e1?.prefFastService == e2?.prefFastService &&
        e1?.prefDriveThru == e2?.prefDriveThru &&
        e1?.prefReservation == e2?.prefReservation &&
        e1?.prefCozyAtmosphere == e2?.prefCozyAtmosphere &&
        e1?.vegetarian == e2?.vegetarian &&
        e1?.hasChildren == e2?.hasChildren &&
        e1?.reservation == e2?.reservation &&
        e1?.fastService == e2?.fastService &&
        e1?.driveThru == e2?.driveThru &&
        e1?.disabilitiesPark == e2?.disabilitiesPark &&
        e1?.perfMovies == e2?.perfMovies &&
        e1?.prefOutDoorStore == e2?.prefOutDoorStore &&
        e1?.prefFoodCort == e2?.prefFoodCort &&
        e1?.schedule == e2?.schedule;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.prefParking,
        e?.prefParking4diesabites,
        e?.prefMoves,
        e?.perfAmusPark,
        e?.perfSuperMarket,
        e?.perfRestursntcaffe,
        e?.hasDisability,
        e?.hasHealthInsurance,
        e?.userLocation,
        e?.prefFastService,
        e?.prefDriveThru,
        e?.prefReservation,
        e?.prefCozyAtmosphere,
        e?.vegetarian,
        e?.hasChildren,
        e?.reservation,
        e?.fastService,
        e?.driveThru,
        e?.disabilitiesPark,
        e?.perfMovies,
        e?.prefOutDoorStore,
        e?.prefFoodCort,
        e?.schedule
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
