import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pricing_record.g.dart';

abstract class PricingRecord
    implements Built<PricingRecord, PricingRecordBuilder> {
  static Serializer<PricingRecord> get serializer => _$pricingRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'cloths_list')
  BuiltList<String> get clothsList;

  @nullable
  @BuiltValueField(wireName: 'cloths_price_list')
  BuiltList<int> get clothsPriceList;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PricingRecordBuilder builder) => builder
    ..clothsList = ListBuilder()
    ..clothsPriceList = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pricing');

  static Stream<PricingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PricingRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PricingRecord._();
  factory PricingRecord([void Function(PricingRecordBuilder) updates]) =
      _$PricingRecord;

  static PricingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPricingRecordData() => serializers.toFirestore(
    PricingRecord.serializer,
    PricingRecord((p) => p
      ..clothsList = null
      ..clothsPriceList = null));
