import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'orders_record.g.dart';

abstract class OrdersRecord
    implements Built<OrdersRecord, OrdersRecordBuilder> {
  static Serializer<OrdersRecord> get serializer => _$ordersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'admin_order_status')
  String get adminOrderStatus;

  @nullable
  @BuiltValueField(wireName: 'customer_order_status')
  String get customerOrderStatus;

  @nullable
  @BuiltValueField(wireName: 'date_time')
  DateTime get dateTime;

  @nullable
  @BuiltValueField(wireName: 'time_slot')
  int get timeSlot;

  @nullable
  @BuiltValueField(wireName: 'service_type')
  String get serviceType;

  @nullable
  BuiltList<String> get items;

  @nullable
  @BuiltValueField(wireName: 'item_rates')
  BuiltList<int> get itemRates;

  @nullable
  @BuiltValueField(wireName: 'per_item_count')
  BuiltList<int> get perItemCount;

  @nullable
  @BuiltValueField(wireName: 'total_cost')
  int get totalCost;

  @nullable
  @BuiltValueField(wireName: 'customer_address')
  String get customerAddress;

  @nullable
  @BuiltValueField(wireName: 'customer_uid')
  String get customerUid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OrdersRecordBuilder builder) => builder
    ..adminOrderStatus = ''
    ..customerOrderStatus = ''
    ..timeSlot = 0
    ..serviceType = ''
    ..items = ListBuilder()
    ..itemRates = ListBuilder()
    ..perItemCount = ListBuilder()
    ..totalCost = 0
    ..customerAddress = ''
    ..customerUid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  OrdersRecord._();
  factory OrdersRecord([void Function(OrdersRecordBuilder) updates]) =
      _$OrdersRecord;

  static OrdersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOrdersRecordData({
  String adminOrderStatus,
  String customerOrderStatus,
  DateTime dateTime,
  int timeSlot,
  String serviceType,
  int totalCost,
  String customerAddress,
  String customerUid,
}) =>
    serializers.toFirestore(
        OrdersRecord.serializer,
        OrdersRecord((o) => o
          ..adminOrderStatus = adminOrderStatus
          ..customerOrderStatus = customerOrderStatus
          ..dateTime = dateTime
          ..timeSlot = timeSlot
          ..serviceType = serviceType
          ..items = null
          ..itemRates = null
          ..perItemCount = null
          ..totalCost = totalCost
          ..customerAddress = customerAddress
          ..customerUid = customerUid));
