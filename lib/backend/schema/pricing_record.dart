import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PricingRecord extends FirestoreRecord {
  PricingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cloths_list" field.
  List<String>? _clothsList;
  List<String> get clothsList => _clothsList ?? const [];
  bool hasClothsList() => _clothsList != null;

  // "cloths_price_list" field.
  List<int>? _clothsPriceList;
  List<int> get clothsPriceList => _clothsPriceList ?? const [];
  bool hasClothsPriceList() => _clothsPriceList != null;

  void _initializeFields() {
    _clothsList = getDataList(snapshotData['cloths_list']);
    _clothsPriceList = getDataList(snapshotData['cloths_price_list']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pricing');

  static Stream<PricingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PricingRecord.fromSnapshot(s));

  static Future<PricingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PricingRecord.fromSnapshot(s));

  static PricingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PricingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PricingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PricingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PricingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PricingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPricingRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class PricingRecordDocumentEquality implements Equality<PricingRecord> {
  const PricingRecordDocumentEquality();

  @override
  bool equals(PricingRecord? e1, PricingRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.clothsList, e2?.clothsList) &&
        listEquality.equals(e1?.clothsPriceList, e2?.clothsPriceList);
  }

  @override
  int hash(PricingRecord? e) =>
      const ListEquality().hash([e?.clothsList, e?.clothsPriceList]);

  @override
  bool isValidKey(Object? o) => o is PricingRecord;
}
