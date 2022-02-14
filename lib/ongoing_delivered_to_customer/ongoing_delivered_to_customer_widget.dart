import 'package:cloud_firestore/cloud_firestore.dart';

import '../auth/auth_util.dart';
import '../backend/schema/orders_record.dart';
import '../confirm_delivery/confirm_delivery_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class OngoingDeliveredToCustomerWidget extends StatefulWidget {
  const OngoingDeliveredToCustomerWidget({Key key, @required this.documentReference}) : super(key: key);
  final DocumentReference<Object> documentReference;

  @override
  _OngoingDeliveredToCustomerWidgetState createState() =>
      _OngoingDeliveredToCustomerWidgetState();
}

class _OngoingDeliveredToCustomerWidgetState
    extends State<OngoingDeliveredToCustomerWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      'Order Details',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Lato',
                        color: Color(0xFF073131),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<OrdersRecord>(
                stream: OrdersRecord.getDocument(widget.documentReference),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.primaryColor,
                        ),
                      ),
                    );
                  }

                  if (snapshot.data.customerOrderStatus != "Ongoing" && snapshot.data.customerOrderStatus != "Completed") {
                    return Container();
                  }

                  if (snapshot.data.customerOrderStatus == "Completed" && snapshot.data.adminOrderStatus == "Delivered" && (snapshot.data.assignedWorker == null || snapshot.data.assignedWorker == "")) {
                    Future.delayed(Duration.zero, () => Navigator.pop(context));
                    return Container();
                  }

                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: Text(
                          'Order Id :     ${snapshot.data.reference.id}',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color(0xFFBBBBBB),
                              width: 0.5,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                                  child: Text(
                                    snapshot.data.serviceType,
                                    style: FlutterFlowTheme.title3.override(
                                      fontFamily: 'Lato',
                                      color: FlutterFlowTheme.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 0.5,
                                color: Color(0xFF818181),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 5),
                                child: Text(
                                  'To be picked up',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF818181),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 10),
                                child: Text(
                                  '${DateFormat('dd-MM-yyyy').format(snapshot.data.dateTime)}   |   ${snapshot.data.timeSlot}',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.secondaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 5),
                                child: Text(
                                  'Total Amount',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF818181),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                                child: Text(
                                  '₹ ${snapshot.data.totalCost}',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.secondaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.tertiaryColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFFBBBBBB),
                            width: 0.5,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                                child: Text(
                                  'Order Summary',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.primaryColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Color(0xFFBBBBBB),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.tertiaryColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 10),
                                        child: Text(
                                          'Items',
                                          style: FlutterFlowTheme.bodyText1.override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF818181),
                                          ),
                                        ),
                                      ),
                                      for (String entry in snapshot.data.items)
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(20, 2, 0, 10),
                                          child: Text(
                                            entry,
                                            style: FlutterFlowTheme.bodyText1.override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF818181),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 10),
                                        child: Text(
                                          'Rate',
                                          style: FlutterFlowTheme.bodyText1.override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF818181),
                                          ),
                                        ),
                                      ),
                                      for (int entry in snapshot.data.itemRates)
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 10),
                                          child: Text(
                                            '₹ $entry',
                                            style: FlutterFlowTheme.bodyText1.override(
                                              fontFamily: 'Lato',
                                              color: FlutterFlowTheme.secondaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 30, 10),
                                        child: Text(
                                          'Quantity',
                                          style: FlutterFlowTheme.bodyText1.override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF818181),
                                          ),
                                        ),
                                      ),
                                      for (int entry in snapshot.data.perItemCount)
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 2, 15, 10),
                                          child: Text(
                                            '$entry',
                                            style: FlutterFlowTheme.bodyText1.override(
                                              fontFamily: 'Lato',
                                              color: FlutterFlowTheme.secondaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 10),
                                        child: Text(
                                          'Cost',
                                          style: FlutterFlowTheme.bodyText1.override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF818181),
                                          ),
                                        ),
                                      ),
                                      for (final entry in IterableZip<int>([snapshot.data.perItemCount.toList(), snapshot.data.itemRates.toList()]))
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 10),
                                          child: Text(
                                            '₹ ${entry[0]*entry[1]}',
                                            style: FlutterFlowTheme.bodyText1.override(
                                              fontFamily: 'Lato',
                                              color: FlutterFlowTheme.secondaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Color(0xFFBBBBBB),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(color: FlutterFlowTheme.tertiaryColor, borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                                    child: Text(
                                      'Total',
                                      style: FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF818181),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 15),
                                    child: Text(
                                      '₹ ${snapshot.data.totalCost}',
                                      style: FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lato',
                                        color: FlutterFlowTheme.secondaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                color: Color(0x12000000),
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:
                                      EdgeInsetsDirectional.fromSTEB(20, 2, 0, 0),
                                      child: Icon(
                                        Icons.home_sharp,
                                        color: FlutterFlowTheme.primaryColor,
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                                      child: Text(
                                        'Pickup Address',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.title3.override(
                                          fontFamily: 'Lato',
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 30),
                                      child: Text(
                                        snapshot.data.customerAddress,
                                        style: FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lato',
                                          color: Color(0xFF494949),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          await FirebaseFirestore.instance.runTransaction((transaction) async{
                            // Order Reads
                            DocumentReference orderRef = widget.documentReference;
                            DocumentSnapshot orderSnapshot = await transaction.get(orderRef);
                            Map<String, dynamic> orderData = orderSnapshot.data();

                            transaction.update(orderRef, {
                              'customer_order_status': orderData['customer_order_status'] != 'Completed' ? 'Completed' : orderData['customer_order_status']
                            });
                          });
                        },
                        text: 'Delivered to Customer',
                        options: FFButtonOptions(
                          width: 200,
                          height: 40,
                          color: FlutterFlowTheme.secondaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Lato',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ],
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
