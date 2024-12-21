import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExpensesRecord extends FirestoreRecord {
  ExpensesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "cost" field.
  double? _cost;
  double get cost => _cost ?? 0.0;
  bool hasCost() => _cost != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "owesMoney" field.
  List<String>? _owesMoney;
  List<String> get owesMoney => _owesMoney ?? const [];
  bool hasOwesMoney() => _owesMoney != null;

  // "receipts" field.
  String? _receipts;
  String get receipts => _receipts ?? '';
  bool hasReceipts() => _receipts != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _desc = snapshotData['desc'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _cost = castToType<double>(snapshotData['cost']);
    _currency = snapshotData['currency'] as String?;
    _owesMoney = getDataList(snapshotData['owesMoney']);
    _receipts = snapshotData['receipts'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('expenses')
          : FirebaseFirestore.instance.collectionGroup('expenses');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('expenses').doc(id);

  static Stream<ExpensesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExpensesRecord.fromSnapshot(s));

  static Future<ExpensesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExpensesRecord.fromSnapshot(s));

  static ExpensesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExpensesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExpensesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExpensesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExpensesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExpensesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExpensesRecordData({
  String? name,
  String? desc,
  DateTime? date,
  double? cost,
  String? currency,
  String? receipts,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'desc': desc,
      'date': date,
      'cost': cost,
      'currency': currency,
      'receipts': receipts,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExpensesRecordDocumentEquality implements Equality<ExpensesRecord> {
  const ExpensesRecordDocumentEquality();

  @override
  bool equals(ExpensesRecord? e1, ExpensesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.desc == e2?.desc &&
        e1?.date == e2?.date &&
        e1?.cost == e2?.cost &&
        e1?.currency == e2?.currency &&
        listEquality.equals(e1?.owesMoney, e2?.owesMoney) &&
        e1?.receipts == e2?.receipts;
  }

  @override
  int hash(ExpensesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.desc,
        e?.date,
        e?.cost,
        e?.currency,
        e?.owesMoney,
        e?.receipts
      ]);

  @override
  bool isValidKey(Object? o) => o is ExpensesRecord;
}
