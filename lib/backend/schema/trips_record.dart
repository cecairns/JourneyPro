import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TripsRecord extends FirestoreRecord {
  TripsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "longandlad" field.
  String? _longandlad;
  String get longandlad => _longandlad ?? '';
  bool hasLongandlad() => _longandlad != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "dateStart" field.
  String? _dateStart;
  String get dateStart => _dateStart ?? '';
  bool hasDateStart() => _dateStart != null;

  // "dateEnd" field.
  String? _dateEnd;
  String get dateEnd => _dateEnd ?? '';
  bool hasDateEnd() => _dateEnd != null;

  // "otherUsers" field.
  List<String>? _otherUsers;
  List<String> get otherUsers => _otherUsers ?? const [];
  bool hasOtherUsers() => _otherUsers != null;

  // "longlat" field.
  LatLng? _longlat;
  LatLng? get longlat => _longlat;
  bool hasLonglat() => _longlat != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  void _initializeFields() {
    _notes = snapshotData['notes'] as String?;
    _address = snapshotData['address'] as String?;
    _country = snapshotData['country'] as String?;
    _city = snapshotData['city'] as String?;
    _longandlad = snapshotData['longandlad'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _dateStart = snapshotData['dateStart'] as String?;
    _dateEnd = snapshotData['dateEnd'] as String?;
    _otherUsers = getDataList(snapshotData['otherUsers']);
    _longlat = snapshotData['longlat'] as LatLng?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _endDate = snapshotData['endDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trips');

  static Stream<TripsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TripsRecord.fromSnapshot(s));

  static Future<TripsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TripsRecord.fromSnapshot(s));

  static TripsRecord fromSnapshot(DocumentSnapshot snapshot) => TripsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TripsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TripsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TripsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TripsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTripsRecordData({
  String? notes,
  String? address,
  String? country,
  String? city,
  String? longandlad,
  DocumentReference? user,
  String? dateStart,
  String? dateEnd,
  LatLng? longlat,
  DateTime? startDate,
  DateTime? endDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notes': notes,
      'address': address,
      'country': country,
      'city': city,
      'longandlad': longandlad,
      'user': user,
      'dateStart': dateStart,
      'dateEnd': dateEnd,
      'longlat': longlat,
      'startDate': startDate,
      'endDate': endDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class TripsRecordDocumentEquality implements Equality<TripsRecord> {
  const TripsRecordDocumentEquality();

  @override
  bool equals(TripsRecord? e1, TripsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.notes == e2?.notes &&
        e1?.address == e2?.address &&
        e1?.country == e2?.country &&
        e1?.city == e2?.city &&
        e1?.longandlad == e2?.longandlad &&
        e1?.user == e2?.user &&
        e1?.dateStart == e2?.dateStart &&
        e1?.dateEnd == e2?.dateEnd &&
        listEquality.equals(e1?.otherUsers, e2?.otherUsers) &&
        e1?.longlat == e2?.longlat &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate;
  }

  @override
  int hash(TripsRecord? e) => const ListEquality().hash([
        e?.notes,
        e?.address,
        e?.country,
        e?.city,
        e?.longandlad,
        e?.user,
        e?.dateStart,
        e?.dateEnd,
        e?.otherUsers,
        e?.longlat,
        e?.startDate,
        e?.endDate
      ]);

  @override
  bool isValidKey(Object? o) => o is TripsRecord;
}
