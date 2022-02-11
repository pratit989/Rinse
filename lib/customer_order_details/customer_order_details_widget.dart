import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';
import 'package:rinse/auth/auth_util.dart';
import 'package:rinse/backend/backend.dart';
import 'package:rinse/flutter_flow/flutter_flow_icon_button.dart';

import '../booking_successful/booking_successful_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class CustomerOrderDetailsWidget extends StatefulWidget {
  const CustomerOrderDetailsWidget({Key key, this.serviceType, this.iconData}) : super(key: key);
  final String serviceType;
  final IconData iconData;

  @override
  _CustomerOrderDetailsWidgetState createState() => _CustomerOrderDetailsWidgetState();
}

class _CustomerOrderDetailsWidgetState extends State<CustomerOrderDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _total = 0;
  IconData _iconData;
  ListBuilder<String> _items = ListBuilder([]);
  ListBuilder<int> _rates = ListBuilder([]);
  ListBuilder<int> _count = ListBuilder([]);
  ListBuilder<int> _itemTotals = ListBuilder([]);
  String _orderId = customAlphabet('1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ', 8);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (List<dynamic> cart
        in FFAppState().serviceSelected == 'Pressing' ? FFAppState().pressingCartItems.values : FFAppState().cleaningPressingCartItems.values) {
      _items.add(cart[0]);
      _rates.add(cart[1]);
      _count.add(cart[2]);
      _itemTotals.add(cart[1] * cart[2]);
      _total += cart[1] * cart[2];
    }
    _iconData = widget.iconData ?? Icons.home_sharp;
  }

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
                  'Order Id :   $_orderId',
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
                            FFAppState().serviceSelected,
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
                          '${DateFormat('dd-MM-yyyy').format(FFAppState().pickupDateDayMonth)}   |   ${FFAppState().selectedTimeCard}',
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
                          '₹ $_total',
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
                              for (String entry in _items.build())
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
                              for (int entry in _rates.build())
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
                              for (int entry in _count.build())
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
                              for (int entry in _itemTotals.build())
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 10),
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
                              '₹ $_total',
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
                                  FFAppState().deliveryAddress,
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: FFButtonWidget(
                  onPressed: () async {
                    final orderCreateData = createOrdersRecordData(
                        adminOrderStatus: null,
                        customerOrderStatus: 'Booked',
                        customerAddress: FFAppState().deliveryAddress,
                        dateTime: FFAppState().pickupDateDayMonth,
                        timeSlot: FFAppState().selectedTimeCard,
                        serviceType: FFAppState().serviceSelected,
                        totalCost: _total,
                        customerUid: currentUserUid,
                        items: _items,
                        itemRates: _rates,
                        perItemCount: _count);
                    OrdersRecord.collection.doc(_orderId).set(orderCreateData);
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingSuccessfulWidget(),
                      ),
                      (r) => false,
                    );
                  },
                  text: 'Confirm Booking',
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
          ),
        ),
      ),
    );
  }
}
