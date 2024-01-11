import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PressingPricingRecord extends FirestoreRecord {
  PressingPricingRecord._(
    super.reference,
    super.data,
  ) {
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
      FirebaseFirestore.instance.collection('pressingPricing');

  static Stream<PressingPricingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PressingPricingRecord.fromSnapshot(s));

  static Future<PressingPricingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PressingPricingRecord.fromSnapshot(s));

  static PressingPricingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PressingPricingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PressingPricingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PressingPricingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PressingPricingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PressingPricingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPressingPricingRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class PressingPricingRecordDocumentEquality
    implements Equality<PressingPricingRecord> {
  const PressingPricingRecordDocumentEquality();

  @override
  bool equals(PressingPricingRecord? e1, PressingPricingRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.clothsList, e2?.clothsList) &&
        listEquality.equals(e1?.clothsPriceList, e2?.clothsPriceList);
  }

  @override
  int hash(PressingPricingRecord? e) =>
      const ListEquality().hash([e?.clothsList, e?.clothsPriceList]);

  @override
  bool isValidKey(Object? o) => o is PressingPricingRecord;
}
