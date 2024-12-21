import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivitiesRecord extends FirestoreRecord {
  ActivitiesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "placeName" field.
  String? _placeName;
  String get placeName => _placeName ?? '';
  bool hasPlaceName() => _placeName != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "longlat" field.
  LatLng? _longlat;
  LatLng? get longlat => _longlat;
  bool hasLonglat() => _longlat != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _category = snapshotData['Category'] as String?;
    _placeName = snapshotData['placeName'] as String?;
    _address = snapshotData['address'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _desc = snapshotData['desc'] as String?;
    _longlat = snapshotData['longlat'] as LatLng?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Activities')
          : FirebaseFirestore.instance.collectionGroup('Activities');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Activities').doc(id);

  static Stream<ActivitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivitiesRecord.fromSnapshot(s));

  static Future<ActivitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivitiesRecord.fromSnapshot(s));

  static ActivitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivitiesRecordData({
  String? category,
  String? placeName,
  String? address,
  DateTime? date,
  String? desc,
  LatLng? longlat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Category': category,
      'placeName': placeName,
      'address': address,
      'date': date,
      'desc': desc,
      'longlat': longlat,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivitiesRecordDocumentEquality implements Equality<ActivitiesRecord> {
  const ActivitiesRecordDocumentEquality();

  @override
  bool equals(ActivitiesRecord? e1, ActivitiesRecord? e2) {
    return e1?.category == e2?.category &&
        e1?.placeName == e2?.placeName &&
        e1?.address == e2?.address &&
        e1?.date == e2?.date &&
        e1?.desc == e2?.desc &&
        e1?.longlat == e2?.longlat;
  }

  @override
  int hash(ActivitiesRecord? e) => const ListEquality().hash(
      [e?.category, e?.placeName, e?.address, e?.date, e?.desc, e?.longlat]);

  @override
  bool isValidKey(Object? o) => o is ActivitiesRecord;
}
