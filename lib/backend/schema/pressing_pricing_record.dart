import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pressing_pricing_record.g.dart';

abstract class PressingPricingRecord
    implements Built<PressingPricingRecord, PressingPricingRecordBuilder> {
  static Serializer<PressingPricingRecord> get serializer =>
      _$pressingPricingRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'cloths_list')
  BuiltList<String> get clothsList;

  @nullable
  @BuiltValueField(wireName: 'cloths_price_list')
  BuiltList<int> get clothsPriceList;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PressingPricingRecordBuilder builder) =>
      builder
        ..clothsList = ListBuilder()
        ..clothsPriceList = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pressingPricing');

  static Stream<PressingPricingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PressingPricingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  PressingPricingRecord._();
  factory PressingPricingRecord(
          [void Function(PressingPricingRecordBuilder) updates]) =
      _$PressingPricingRecord;

  static PressingPricingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPressingPricingRecordData() =>
    serializers.toFirestore(
        PressingPricingRecord.serializer,
        PressingPricingRecord((p) => p
          ..clothsList = null
          ..clothsPriceList = null));
