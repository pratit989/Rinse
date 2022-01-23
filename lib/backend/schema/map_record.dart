import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'map_record.g.dart';

abstract class MapRecord implements Built<MapRecord, MapRecordBuilder> {
  static Serializer<MapRecord> get serializer => _$mapRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'lat_lng')
  LatLng get latLng;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MapRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('map');

  static Stream<MapRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MapRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MapRecord._();
  factory MapRecord([void Function(MapRecordBuilder) updates]) = _$MapRecord;

  static MapRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMapRecordData({
  LatLng latLng,
}) =>
    serializers.toFirestore(
        MapRecord.serializer, MapRecord((m) => m..latLng = latLng));
