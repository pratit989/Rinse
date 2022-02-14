import 'package:flutter/material.dart';
import 'package:rinse/backend/backend.dart';
import 'package:rinse/flutter_flow/flutter_flow_icon_button.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';

import 'package:collection/collection.dart';

class ExistingOrderDetailsWidget extends StatefulWidget {
  const ExistingOrderDetailsWidget({Key key, this.docRef}) : super(key: key);
  final DocumentReference docRef;

  @override
  _ExistingOrderDetailsWidgetState createState() => _ExistingOrderDetailsWidgetState();
}

class _ExistingOrderDetailsWidgetState extends State<ExistingOrderDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  IconData _iconData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iconData = Icons.location_on;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<OrdersRecord>(
            future: OrdersRecord.getDocumentOnce(widget.docRef),
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
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
                            )),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                            child: Text(
                              'Order Details',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.title3.override(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Text(
                      'Order Id :   ${snapshot.data.reference.id}',
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
                                  padding: EdgeInsetsDirectional.fromSTEB(20, 2, 0, 0),
                                  child: Icon(
                                    _iconData,
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
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      snapshot.data.customerAddress,
                                      style: FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF494949),
                                      ),
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
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
