import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingSuccessfulWidget extends StatefulWidget {
  const BookingSuccessfulWidget({Key key}) : super(key: key);

  @override
  _BookingSuccessfulWidgetState createState() =>
      _BookingSuccessfulWidgetState();
}

class _BookingSuccessfulWidgetState extends State<BookingSuccessfulWidget> {
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
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, MediaQuery.of(context).size.height*0.2, 0, 50),
                child: Text(
                  'Booking Successful !',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lato',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
              child: Image.asset(
                'assets/images/booking-confirmed.png',
                width: MediaQuery.of(context).size.width * 0.27,
                height: MediaQuery.of(context).size.height * 0.12,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: InkWell(
                onTap: () async {
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CustomerNavBarPage(initialPage: 'CustomerMyOrders'),
                    ),
                    (r) => false,
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.tertiaryColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xFFC0C0C0),
                      width: 0.5,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'See Order Details',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        color: FlutterFlowTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerNavBarPage(initialPage: 'Home'),
                  ),
                  (r) => false,
                );
              },
              child: Text(
                'Go back to Home Page',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Lato',
                  color: Color(0xFFCA5564),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
