import 'package:flutter/material.dart';
import 'package:rinse/backend/backend.dart';
import 'package:rinse/components/pickup_confirmation_box_widget.dart';
import 'package:rinse/received_order_details/received_orders_details_widget.dart';

import '../components/received_confirmation_box_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class AdminReceivedOrdersWidget extends StatefulWidget {
  const AdminReceivedOrdersWidget({Key key}) : super(key: key);

  @override
  _AdminReceivedOrdersWidgetState createState() => _AdminReceivedOrdersWidgetState();
}

class _AdminReceivedOrdersWidgetState extends State<AdminReceivedOrdersWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String adminOrderStatus = 'Received';
  bool pickup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Visibility(
            visible: !pickup,
            replacement: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Row(
                      children: [
                        Padding(
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
                                setState(() {
                                  pickup = !pickup;
                                });
                              },
                            )
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 70, 0),
                            child: Text(
                              'Pickup Requests',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lato',
                                color: Color(0xFF073131),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder<List<OrdersRecord>>(
                      stream: queryOrdersRecord(queryBuilder: (obj) => obj.where('admin_order_status', isEqualTo: 'Packed').where('assigned_worker', isNull: false)),
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

                        if (snapshot.data.isEmpty) {
                          return Container();
                        }

                        List<OrdersRecord> _ordersRecords = snapshot.data;

                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: ListView.builder(
                            itemCount: _ordersRecords.length,
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: Color(0x0B000000),
                                        offset: Offset(0.5, 2),
                                        spreadRadius: 0,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        height: MediaQuery.of(context).size.height * 0.05,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                child: Text(
                                                  'Order Id :    ${_ordersRecords[index].reference.id}',
                                                  style: FlutterFlowTheme.bodyText1.override(
                                                    fontFamily: 'Open Sans',
                                                    color: FlutterFlowTheme.primaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                                child: Text(
                                                  '₹${_ordersRecords[index].totalCost}',
                                                  style: FlutterFlowTheme.bodyText1.override(
                                                    fontFamily: 'Lato',
                                                    color: Color(0xFF818181),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 0.5,
                                        color: Color(0xFF818181),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                              child: Text(
                                                '${DateFormat('dd-MM-yyyy').format(_ordersRecords[index].dateTime)}   |  ${_ordersRecords[index].timeSlot}',
                                                style: FlutterFlowTheme.bodyText1.override(
                                                  fontFamily: 'Lato',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ReceivedOrderDetailsWidget(documentReference: _ordersRecords[index].reference)));
                                                },
                                                child: Text(
                                                  'View Order Details',
                                                  style: FlutterFlowTheme.bodyText1.override(
                                                    fontFamily: 'Lato',
                                                    color: FlutterFlowTheme.secondaryColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Visibility(
                                        visible: _ordersRecords[index].assignedWorker != null,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor: Colors.transparent,
                                                      barrierColor: Colors.transparent,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding: MediaQuery.of(context).viewInsets,
                                                          child: PickupConfirmationBoxWidget(
                                                            documentReference: _ordersRecords[index].reference,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                                    child: Text('Confirm Order Received'),
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
                              );
                            },
                          ),
                        );
                      }),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Text(
                      'Orders',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        color: Color(0xFF073131),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            setState(() {
                              adminOrderStatus = 'Received';
                            });
                          },
                          text: 'Received',
                          options: FFButtonOptions(
                            elevation: 0,
                            width: 110,
                            height: 35,
                            color: adminOrderStatus == 'Received' ? FlutterFlowTheme.secondaryColor : FlutterFlowTheme.tertiaryColor,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Open Sans',
                              color: adminOrderStatus == 'Received' ? Colors.white : Color(0xFF9C9C9C),
                              fontSize: 14,
                            ),
                            borderSide: BorderSide(
                              color: adminOrderStatus == 'Received' ? Colors.transparent : Color(0xFF949496),
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            setState(() {
                              adminOrderStatus = 'Packed';
                            });
                          },
                          text: 'Packed',
                          options: FFButtonOptions(
                            elevation: 0,
                            width: 110,
                            height: 35,
                            color: adminOrderStatus == 'Packed' ? FlutterFlowTheme.secondaryColor : FlutterFlowTheme.tertiaryColor,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Open Sans',
                              color: adminOrderStatus == 'Packed' ? Colors.white : Color(0xFF9C9C9C),
                              fontSize: 14,
                            ),
                            borderSide: BorderSide(
                              color: adminOrderStatus == 'Packed' ? Colors.transparent : Color(0xFF949496),
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          setState(() {
                            adminOrderStatus = 'Delivered';
                          });
                        },
                        text: 'Delivered',
                        options: FFButtonOptions(
                          elevation: 0,
                          width: 110,
                          height: 35,
                          color: adminOrderStatus == 'Delivered' ? FlutterFlowTheme.secondaryColor : FlutterFlowTheme.tertiaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Open Sans',
                            color: adminOrderStatus == 'Delivered' ? Colors.white : Color(0xFF9C9C9C),
                            fontSize: 14,
                          ),
                          borderSide: BorderSide(
                            color: adminOrderStatus == 'Delivered' ? Colors.transparent : Color(0xFF949496),
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder<List<OrdersRecord>>(
                      stream: queryOrdersRecord(queryBuilder: (obj) => obj.where('admin_order_status', isEqualTo: adminOrderStatus)),
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

                        if (snapshot.data.isEmpty) {
                          return Container();
                        }

                        List<OrdersRecord> _ordersRecords = snapshot.data;

                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: ListView.builder(
                            itemCount: _ordersRecords.length,
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: Color(0x0B000000),
                                        offset: Offset(0.5, 2),
                                        spreadRadius: 0,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        height: MediaQuery.of(context).size.height * 0.05,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                child: Text(
                                                  'Order Id :    ${_ordersRecords[index].reference.id}',
                                                  style: FlutterFlowTheme.bodyText1.override(
                                                    fontFamily: 'Open Sans',
                                                    color: FlutterFlowTheme.primaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                                child: Text(
                                                  '₹${_ordersRecords[index].totalCost}',
                                                  style: FlutterFlowTheme.bodyText1.override(
                                                    fontFamily: 'Lato',
                                                    color: Color(0xFF818181),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 0.5,
                                        color: Color(0xFF818181),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                              child: Text(
                                                '${DateFormat('dd-MM-yyyy').format(_ordersRecords[index].dateTime)}   |  ${_ordersRecords[index].timeSlot}',
                                                style: FlutterFlowTheme.bodyText1.override(
                                                  fontFamily: 'Lato',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ReceivedOrderDetailsWidget(documentReference: _ordersRecords[index].reference)));
                                                },
                                                child: Text(
                                                  'View Order Details',
                                                  style: FlutterFlowTheme.bodyText1.override(
                                                    fontFamily: 'Lato',
                                                    color: FlutterFlowTheme.secondaryColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Visibility(
                                        visible: _ordersRecords[index].assignedWorker != null,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor: Colors.transparent,
                                                      barrierColor: Colors.transparent,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding: MediaQuery.of(context).viewInsets,
                                                          child: ReceivedConfirmationBoxWidget(
                                                            documentReference: _ordersRecords[index].reference,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0,0,0,10),
                                                    child: Text('Confirm Order Received'),
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
                              );
                            },
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: !pickup,
        child: Container(
          height: 30,
          width: 175,
          child: FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                pickup = !pickup;
              });
            },
            label: Text('See Pickup Requests', style: FlutterFlowTheme.bodyText1.copyWith(color: Colors.white),),
            backgroundColor: FlutterFlowTheme.primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
