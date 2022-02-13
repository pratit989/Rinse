
import 'package:flutter/material.dart';
import 'package:rinse/backend/backend.dart';
import 'package:rinse/existing_order_details_widget/existing_order_details_widget.dart';

import '../customer_order_details/customer_order_details_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class CustomerMyOrdersWidget extends StatefulWidget {
  const CustomerMyOrdersWidget({Key key}) : super(key: key);

  @override
  _CustomerMyOrdersWidgetState createState() => _CustomerMyOrdersWidgetState();
}

class _CustomerMyOrdersWidgetState extends State<CustomerMyOrdersWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String customerOrderStatus = 'Booked';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      'My Orders',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        color: Color(0xFF073131),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0, -0.4),
                    child: Text(
                      'No Orders Found',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        color: Color(0xFF979797),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30),
                    child: Text(
                      'My Orders',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.title3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            setState(() {
                              customerOrderStatus = 'Booked';
                            });
                          },
                          text: 'Booked',
                          options: FFButtonOptions(
                            width: 110,
                            height: 35,
                            color: customerOrderStatus == 'Booked' ? FlutterFlowTheme.secondaryColor : FlutterFlowTheme.tertiaryColor,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Open Sans',
                              color: customerOrderStatus == 'Booked' ? Colors.white : Color(0xFF9C9C9C),
                              fontSize: 14,
                            ),
                            borderSide: BorderSide(
                              color: customerOrderStatus == 'Booked' ? Colors.transparent : Color(0xFF949496),
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
                              customerOrderStatus = 'Ongoing';
                            });
                          },
                          text: 'Ongoing',
                          options: FFButtonOptions(
                            width: 110,
                            height: 35,
                            color: customerOrderStatus == 'Ongoing' ? FlutterFlowTheme.secondaryColor : FlutterFlowTheme.tertiaryColor,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Open Sans',
                              color: customerOrderStatus == 'Ongoing' ? Colors.white : Color(0xFF9C9C9C),
                              fontSize: 14,
                            ),
                            borderSide: BorderSide(
                              color: customerOrderStatus == 'Ongoing' ? Colors.transparent : Color(0xFF949496),
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          setState(() {
                            customerOrderStatus = 'Completed';
                          });
                        },
                        text: 'Completed',
                        options: FFButtonOptions(
                          width: 110,
                          height: 35,
                          color: customerOrderStatus == 'Completed' ? FlutterFlowTheme.secondaryColor : FlutterFlowTheme.tertiaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Open Sans',
                            color: customerOrderStatus == 'Completed' ? Colors.white : Color(0xFF9C9C9C),
                            fontSize: 14,
                          ),
                          borderSide: BorderSide(
                            color: customerOrderStatus == 'Completed' ? Colors.transparent : Color(0xFF949496),
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.73,
                    child: StreamBuilder<List<OrdersRecord>>(
                        stream: queryOrdersRecord(queryBuilder: (obj) => obj.where('customer_order_status', isEqualTo: customerOrderStatus)),
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

                          return ListView.builder(
                            itemCount: _ordersRecords.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Material(
                                    color: Colors.transparent,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        height: MediaQuery.of(context).size.height * 0.16,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
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
                                            Row(
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
                                                  child: Text(
                                                    'Awaiting Pickup',
                                                    style: FlutterFlowTheme.bodyText1.override(
                                                      fontFamily: 'Lato',
                                                      color: FlutterFlowTheme.primaryColor,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => ExistingOrderDetailsWidget(
                                                        docRef: _ordersRecords[index].reference,
                                                      ),
                                                    ),
                                                  );
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
                                        ))),
                              );
                            },
                          );
                        }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
