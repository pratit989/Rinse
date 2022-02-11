import '../add_address/add_address_widget.dart';
import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../welcome/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Icon(
                        Icons.account_circle,
                        color: FlutterFlowTheme.primaryColor,
                        size: 24,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 150, 0),
                      child: Text(
                        'My Profile',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Lato',
                          color: FlutterFlowTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: AuthUserStreamWidget(
                        child: Text(
                          currentUserDisplayName,
                          style: FlutterFlowTheme.title3.override(
                            fontFamily: 'Lato',
                            color: FlutterFlowTheme.secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                AuthUserStreamWidget(
                  child: Text(
                    '${currentUserEmail} | ${currentPhoneNumber}',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lato',
                      color: Color(0xFF818181),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(50, 50, 50, 50),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddAddressWidget(),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.05,
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
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Text(
                                'Manage Addresses',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF1F4444),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: FlutterFlowTheme.secondaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await signOut();
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeWidget(),
                      ),
                      (r) => false,
                    );
                  },
                  text: 'Logout',
                  options: FFButtonOptions(
                    width: 175,
                    height: 39,
                    color: FlutterFlowTheme.primaryColor,
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
