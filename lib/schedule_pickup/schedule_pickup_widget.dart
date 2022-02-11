import 'package:flutter/material.dart';
import 'package:rinse/address_selection/address_selection.dart';

import '../components/date_button_widget.dart';
import '../components/service_selector_widget.dart';
import '../components/time_slot_buttons_widget.dart';
import '../customer_order_details/customer_order_details_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class SchedulePickupWidget extends StatefulWidget {
  const SchedulePickupWidget({Key key}) : super(key: key);

  @override
  _SchedulePickupWidgetState createState() => _SchedulePickupWidgetState();
}

class _SchedulePickupWidgetState extends State<SchedulePickupWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  IconData _iconData = Icons.home;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      FFAppState().deliveryAddress = FFAppState().deliveryAddress.replaceAll(' | ', '').trim() != ''
          ? FFAppState().deliveryAddress
          : FFAppState().homeAddress.replaceAll(' | ', '').trim();
      FFAppState().pickupDateDayMonth = DateTime.now();
      FFAppState().selectedTimeCard = '';
      FFAppState().selectedDateDayMonth = 0;
    });
    super.initState();
  }

  refresh() => setState(() => FFAppState().selectedTimeCard = '');

  setIcon(IconData newIcon) => setState(() => _iconData = newIcon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 50, 0),
                    child: InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                      child: Text(
                        'Schedule Pickup',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.title3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: Color(0x12000000),
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFF707070),
                  width: 0.2,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
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
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
                              child: Text(
                                FFAppState().deliveryAddress.replaceAll(' | ', '').trim() != ''
                                    ? FFAppState().deliveryAddress
                                    : FFAppState().homeAddress.replaceAll(' | ', '').trim() ?? 'Satsang Tower Near XYZ\nRoad no. 12 Xyz .\nChembur - 400071',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lato',
                                  color: Color(0xE5494949),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () =>
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddressSelectionWidget())).then((value) => setIcon(value ?? Icons.home)),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(60, 0, 10, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                              child: Text(
                                'Change',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lato',
                                  color: FlutterFlowTheme.secondaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.85, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                child: Text(
                  'Select pick up date',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
              ),
              child: DateButtonWidget(
                notifyParent: refresh,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.85, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                child: Text(
                  'Select a suitable time slot',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                child: TimeSlotButtonsWidget(),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.9, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                child: Text(
                  'Select Services',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                child: ServiceSelectorWidget(),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
              child: FFButtonWidget(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomerOrderDetailsWidget(
                        iconData: _iconData,
                      ),
                    ),
                  );
                },
                text: 'Proceed',
                options: FFButtonOptions(
                  width: 200,
                  height: 40,
                  color: FlutterFlowTheme.secondaryColor,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Lato',
                    color: Colors.white,
                    fontSize: 14,
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
    );
  }
}
