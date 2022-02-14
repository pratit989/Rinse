import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../worker_home/worker_home_widget.dart';
import 'package:flutter/material.dart';

class WorkerLoginWidget extends StatefulWidget {
  const WorkerLoginWidget({Key key}) : super(key: key);

  @override
  _WorkerLoginWidgetState createState() => _WorkerLoginWidgetState();
}

class _WorkerLoginWidgetState extends State<WorkerLoginWidget> {
  TextEditingController emailInputController;
  TextEditingController passwordInputController;
  bool passwordInputVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _emailEditing;
  bool _passwordEditing;

  @override
  void initState() {
    super.initState();
    emailInputController = TextEditingController();
    passwordInputController = TextEditingController();
    passwordInputVisibility = false;
    _passwordEditing = false;
    _emailEditing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: FlutterFlowTheme.primaryColor,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 40, 10, 40),
                    child: Text(
                      'Enter Your Login Information',
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
                        onTap: () {
                          _emailEditing = true;
                          _passwordEditing = false;
                        },
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
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: _passwordEditing ? Colors.transparent : Colors.white,
                      boxShadow: [
                        _passwordEditing ? BoxShadow(color: Color.fromARGB(0, 0, 0, 0), offset: Offset(0, 0), blurRadius: 0) : BoxShadow(
                          blurRadius: 2,
                          color: Color(0x12000000),
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      border: _passwordEditing ? Border.all(
                          color: Color(0x1F4444A3),
                          width: 0.5
                      ) : Border.all(width: 0, color: Colors.transparent, style: BorderStyle.none),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                      child: TextFormField(
                        onTap: () {
                          _emailEditing = false;
                          _passwordEditing = true;
                        },
                        controller: passwordInputController,
                        obscureText: !passwordInputVisibility,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                          isDense: true,
                          hintText: 'Enter Password',
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          hintStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lato',
                            color: Color(0xFFB1B1B1),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFFB1B1B1),
                            size: 18,
                          ),
                          suffixIcon: InkWell(
                            onTap: () => setState(
                                  () => passwordInputVisibility =
                              !passwordInputVisibility,
                            ),
                            child: Icon(
                              passwordInputVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Color(0xFFB1B1B1),
                              size: 22,
                            ),
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
                            return 'Please enter your password';
                          } else if (val.length < 6) {
                            return 'Password should be at least 6 digits long';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(50, 50, 50, 50),
              child: FFButtonWidget(
                onPressed: () async {
                  if (!formKey.currentState.validate()) {
                    return;
                  }
                  final value = await UsersRecord.collection.doc('admins').get();
                    Map<String, dynamic> usersRecord = value.data();
                    if (!usersRecord['emails'].contains(emailInputController.text)) {
                      final user = await signInWithEmail(
                        context,
                        emailInputController.text,
                        passwordInputController.text,
                      );
                      if (user == null) {
                        return;
                      }

                      final usersUpdateData = createUsersRecordData(
                        email: emailInputController.text,
                        userType: 'Worker',
                      );
                      await currentUserReference.update(usersUpdateData);
                      await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkerHomeWidget(),
                        ),
                            (r) => false,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Worker Credentials')));
                    }
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
    );
  }
}
