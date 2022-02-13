import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterYourInfoWidget extends StatefulWidget {
  const EnterYourInfoWidget({Key key}) : super(key: key);

  @override
  _EnterYourInfoWidgetState createState() => _EnterYourInfoWidgetState();
}

class _EnterYourInfoWidgetState extends State<EnterYourInfoWidget> {
  TextEditingController emailInputController;
  TextEditingController firstNameInputController;
  TextEditingController lastNameInputController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _emailEditing;
  bool _firstNameEditing;
  bool _lastNameEditing;

  @override
  void initState() {
    super.initState();
    emailInputController = TextEditingController();
    firstNameInputController = TextEditingController();
    lastNameInputController = TextEditingController();
    _emailEditing = false;
    _firstNameEditing = false;
    _lastNameEditing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, MediaQuery.of(context).size.height*0.1, 10, 40),
                  child: Text(
                    'Enter Your Information',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: _firstNameEditing ? Colors.transparent : Colors.white,
                    boxShadow: [
                      _firstNameEditing ? BoxShadow(color: Color.fromARGB(0, 0, 0, 0), offset: Offset(0, 0), blurRadius: 0) : BoxShadow(
                        blurRadius: 2,
                        color: Color(0x12000000),
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    border: _firstNameEditing ? Border.all(
                        color: Color(0x1F4444A3),
                        width: 0.5
                    ) : Border.all(width: 0, color: Colors.transparent, style: BorderStyle.none),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: TextFormField(
                      onTap: () => setState(() {
                        _firstNameEditing = true;
                        _lastNameEditing = false;
                        _emailEditing = false;
                      }),
                      controller: firstNameInputController,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        isDense: true,
                        hintText: 'First Name',
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lato',
                          color: Color(0xFFB1B1B1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xFFB1B1B1),
                          size: 18,
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        color: Color(0xFFB1B1B1),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter your first name';
                        }

                        return null;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: _lastNameEditing ? Colors.transparent : Colors.white,
                    boxShadow: [
                      _lastNameEditing ? BoxShadow(color: Color.fromARGB(0, 0, 0, 0), offset: Offset(0, 0), blurRadius: 0) : BoxShadow(
                        blurRadius: 2,
                        color: Color(0x12000000),
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    border: _lastNameEditing ? Border.all(
                        color: Color(0x1F4444A3),
                        width: 0.5
                    ) : Border.all(width: 0, color: Colors.transparent, style: BorderStyle.none),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: TextFormField(
                      onTap: () => setState(() {
                        _firstNameEditing = false;
                        _lastNameEditing = true;
                        _emailEditing = false;
                      }),
                      controller: lastNameInputController,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        isDense: true,
                        hintText: 'Last Name',
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lato',
                          color: Color(0xFFB1B1B1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xFFB1B1B1),
                          size: 18,
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        color: Color(0xFFB1B1B1),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: _emailEditing ? Colors.transparent : Colors.white,
                    boxShadow: [
                      _emailEditing ? BoxShadow(color: Color.fromARGB(0, 0, 0, 0), offset: Offset(0, 0), blurRadius: 0) : BoxShadow(
                        blurRadius: 2,
                        color: Color(0x12000000),
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    border: _emailEditing ? Border.all(
                        color: Color(0x1F4444A3),
                        width: 0.5
                    ) : Border.all(width: 0, color: Colors.transparent, style: BorderStyle.none),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: TextFormField(
                      onTap: () => setState(() {
                        _emailEditing = true;
                        _firstNameEditing = false;
                        _lastNameEditing = false;
                      }),
                      controller: emailInputController,
                      obscureText: false,
                      decoration: InputDecoration(
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        isDense: true,
                        hintText: 'Email Address',
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lato',
                          color: Color(0xFFB1B1B1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Color(0xFFB1B1B1),
                          size: 18,
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        color: Color(0xFFB1B1B1),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter your email';
                        } else if (!val.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (!formKey.currentState.validate()) {
                      return;
                    }
                    final usersUpdateData = createUsersRecordData(
                      email: emailInputController.text,
                      displayName:
                      '${firstNameInputController.text} ${lastNameInputController.text}',
                      userType: 'Customer',
                    );
                    await currentUserReference.update(usersUpdateData);
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomerNavBarPage(initialPage: 'Home'),
                      ),
                          (r) => false,
                    );
                  },
                  text: 'Proceed',
                  options: FFButtonOptions(
                    width: 203,
                    height: 35,
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
                    borderRadius: 10,
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
