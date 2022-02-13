import 'package:rinse/auth/auth_util.dart';
import 'package:rinse/backend/backend.dart';
import 'package:rinse/flutter_flow/flutter_flow_icon_button.dart';
import 'package:collection/collection.dart';
import 'package:rinse/ongoing_delivered_to_laundry/ongoing_delivered_to_laundry_widget.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class ReceivedOrderDetailsWidget extends StatefulWidget {
  const ReceivedOrderDetailsWidget({Key key, @required this.documentReference}) : super(key: key);
  final DocumentReference documentReference;

  @override
  _ReceivedOrderDetailsWidgetState createState() =>
      _ReceivedOrderDetailsWidgetState();
}

class _ReceivedOrderDetailsWidgetState extends State<ReceivedOrderDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: Color(0xFF1F4444),
                              size: 30,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          )
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 70, 0),
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
                                    'To be picked',
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
                            height: MediaQuery.of(context).size.height * 0.15,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
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
                        Visibility(
                          visible: snapshot.data.adminOrderStatus == "Received",
                          child: FFButtonWidget(
                            onPressed: () async {
                              await FirebaseFirestore.instance.runTransaction((transaction) async{
                                // Order Reads
                                DocumentReference orderRef = widget.documentReference;
                                DocumentSnapshot orderSnapshot = await transaction.get(orderRef);
                                Map<String, dynamic> orderData = orderSnapshot.data();
                                String status = orderData.containsKey('admin_order_status') ? orderData['admin_order_status'] : null;
                                // Remember to do all the writes at the End
                                transaction.update(orderRef,{
                                  'admin_order_status' : status != 'Packed' ? 'Packed' : status,
                                });
                              }).whenComplete(() => Navigator.pop(context));
                            },
                            text: 'Confirm Packing',
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
                        ),
                      ],
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
