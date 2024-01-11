import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'enter_your_info_model.dart';
export 'enter_your_info_model.dart';

class EnterYourInfoWidget extends StatefulWidget {
  const EnterYourInfoWidget({Key? key}) : super(key: key);

  @override
  _EnterYourInfoWidgetState createState() => _EnterYourInfoWidgetState();
}

class _EnterYourInfoWidgetState extends State<EnterYourInfoWidget> {
  late EnterYourInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnterYourInfoModel());

    _model.firstNameInputController ??= TextEditingController();
    _model.firstNameInputFocusNode ??= FocusNode();

    _model.lastNameInputController ??= TextEditingController();
    _model.lastNameInputFocusNode ??= FocusNode();

    _model.emailInputController ??= TextEditingController();
    _model.emailInputFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 30.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 40.0, 10.0, 40.0),
                    child: Text(
                      'Enter Your Information',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                      color: Color(0xFFFAFAFA),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2.0,
                          color: Color(0x12000000),
                          offset: Offset(0.0, 2.0),
                          spreadRadius: 0.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _model.firstNameInputController,
                        focusNode: _model.firstNameInputFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'First Name',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xFFB1B1B1),
                            size: 18.0,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lato',
                              color: Color(0xFFB1B1B1),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                        validator: _model.firstNameInputControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                      color: Color(0xFFFAFAFA),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2.0,
                          color: Color(0x12000000),
                          offset: Offset(0.0, 2.0),
                          spreadRadius: 0.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _model.lastNameInputController,
                        focusNode: _model.lastNameInputFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Last Name',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xFFB1B1B1),
                            size: 18.0,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lato',
                              color: Color(0xFFB1B1B1),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                        validator: _model.lastNameInputControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                      color: Color(0xFFFAFAFA),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2.0,
                          color: Color(0x12000000),
                          offset: Offset(0.0, 2.0),
                          spreadRadius: 0.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _model.emailInputController,
                        focusNode: _model.emailInputFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Email Address',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xFFB1B1B1),
                            size: 18.0,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lato',
                              color: Color(0xFFB1B1B1),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                        keyboardType: TextInputType.emailAddress,
                        validator: _model.emailInputControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(50.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await currentUserReference!.update(createUsersRecordData(
                    email: _model.emailInputController.text,
                    displayName:
                        '${_model.firstNameInputController.text} ${_model.lastNameInputController.text}',
                    userType: 'Customer',
                  ));
                  Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                      reverseDuration: Duration(milliseconds: 0),
                      child: NavBarPage(initialPage: 'Home'),
                    ),
                    (r) => false,
                  );
                },
                text: 'Proceed',
                options: FFButtonOptions(
                  width: 203.0,
                  height: 35.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lato',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
