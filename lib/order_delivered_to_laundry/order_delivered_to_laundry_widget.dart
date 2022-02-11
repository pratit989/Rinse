import 'package:rinse/backend/backend.dart';

import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import '../ongoing_delivered_to_laundry/ongoing_delivered_to_laundry_widget.dart';
import '../worker_home/worker_home_widget.dart';

class OrderDeliveredToLaundryWidget extends StatefulWidget {
  const OrderDeliveredToLaundryWidget({Key key, @required this.documentReference}) : super(key: key);
  final DocumentReference documentReference;

  @override
  _OrderDeliveredToLaundryWidgetState createState() =>
      _OrderDeliveredToLaundryWidgetState();
}

class _OrderDeliveredToLaundryWidgetState
    extends State<OrderDeliveredToLaundryWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 20),
                child: Text(
                  'Order Delivered to Laundry !',
                  style: FlutterFlowTheme.title3.override(
                    fontFamily: 'Lato',
                    color: Color(0xFF073131),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              elevation: 1,
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
                child: FutureBuilder<OrdersRecord>(
                  future: OrdersRecord.getDocumentOnce(widget.documentReference),
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
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                  child: Text(
                                    'Order Id :    ${snapshot.data.reference.id}',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                  child: Text(
                                    '₹${snapshot.data.totalCost}',
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
                                '${DateFormat('dd-MM-yyyy').format(snapshot.data.dateTime)}   |  ${snapshot.data.timeSlot}',
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
                      ],
                    );
                  }
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => currentUserDocument.acceptedOrder == '' || currentUserDocument.acceptedOrder == null ? WorkerNavBarPage(pageType: "pickupFromCustomer", initialPage: 'NewOrders',) : OngoingDeliveredToLaundryWidget(documentReference: OrdersRecord.collection.doc(currentUserDocument.acceptedOrder),),
                    ),
                  );
                },
                text: 'See New Orders',
                options: FFButtonOptions(
                  width: 200,
                  height: 40,
                  color: FlutterFlowTheme.secondaryColor,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Lato',
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }
}
