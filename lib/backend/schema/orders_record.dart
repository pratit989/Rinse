import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "admin_order_status" field.
  String? _adminOrderStatus;
  String get adminOrderStatus => _adminOrderStatus ?? '';
  bool hasAdminOrderStatus() => _adminOrderStatus != null;

  // "customer_order_status" field.
  String? _customerOrderStatus;
  String get customerOrderStatus => _customerOrderStatus ?? '';
  bool hasCustomerOrderStatus() => _customerOrderStatus != null;

  // "date_time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "time_slot" field.
  int? _timeSlot;
  int get timeSlot => _timeSlot ?? 0;
  bool hasTimeSlot() => _timeSlot != null;

  // "service_type" field.
  String? _serviceType;
  String get serviceType => _serviceType ?? '';
  bool hasServiceType() => _serviceType != null;

  // "items" field.
  List<String>? _items;
  List<String> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "item_rates" field.
  List<int>? _itemRates;
  List<int> get itemRates => _itemRates ?? const [];
  bool hasItemRates() => _itemRates != null;

  // "per_item_count" field.
  List<int>? _perItemCount;
  List<int> get perItemCount => _perItemCount ?? const [];
  bool hasPerItemCount() => _perItemCount != null;

  // "total_cost" field.
  int? _totalCost;
  int get totalCost => _totalCost ?? 0;
  bool hasTotalCost() => _totalCost != null;

  // "customer_address" field.
  String? _customerAddress;
  String get customerAddress => _customerAddress ?? '';
  bool hasCustomerAddress() => _customerAddress != null;

  // "customer_uid" field.
  String? _customerUid;
  String get customerUid => _customerUid ?? '';
  bool hasCustomerUid() => _customerUid != null;

  void _initializeFields() {
    _adminOrderStatus = snapshotData['admin_order_status'] as String?;
    _customerOrderStatus = snapshotData['customer_order_status'] as String?;
    _dateTime = snapshotData['date_time'] as DateTime?;
    _timeSlot = castToType<int>(snapshotData['time_slot']);
    _serviceType = snapshotData['service_type'] as String?;
    _items = getDataList(snapshotData['items']);
    _itemRates = getDataList(snapshotData['item_rates']);
    _perItemCount = getDataList(snapshotData['per_item_count']);
    _totalCost = castToType<int>(snapshotData['total_cost']);
    _customerAddress = snapshotData['customer_address'] as String?;
    _customerUid = snapshotData['customer_uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? adminOrderStatus,
  String? customerOrderStatus,
  DateTime? dateTime,
  int? timeSlot,
  String? serviceType,
  int? totalCost,
  String? customerAddress,
  String? customerUid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'admin_order_status': adminOrderStatus,
      'customer_order_status': customerOrderStatus,
      'date_time': dateTime,
      'time_slot': timeSlot,
      'service_type': serviceType,
      'total_cost': totalCost,
      'customer_address': customerAddress,
      'customer_uid': customerUid,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.adminOrderStatus == e2?.adminOrderStatus &&
        e1?.customerOrderStatus == e2?.customerOrderStatus &&
        e1?.dateTime == e2?.dateTime &&
        e1?.timeSlot == e2?.timeSlot &&
        e1?.serviceType == e2?.serviceType &&
        listEquality.equals(e1?.items, e2?.items) &&
        listEquality.equals(e1?.itemRates, e2?.itemRates) &&
        listEquality.equals(e1?.perItemCount, e2?.perItemCount) &&
        e1?.totalCost == e2?.totalCost &&
        e1?.customerAddress == e2?.customerAddress &&
        e1?.customerUid == e2?.customerUid;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.adminOrderStatus,
        e?.customerOrderStatus,
        e?.dateTime,
        e?.timeSlot,
        e?.serviceType,
        e?.items,
        e?.itemRates,
        e?.perItemCount,
        e?.totalCost,
        e?.customerAddress,
        e?.customerUid
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
