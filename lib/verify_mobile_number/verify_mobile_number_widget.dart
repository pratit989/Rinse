import '../auth/auth_util.dart';
import '../customer_login/customer_login_widget.dart';
import '../enter_your_info/enter_your_info_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyMobileNumberWidget extends StatefulWidget {
  const VerifyMobileNumberWidget({Key key}) : super(key: key);

  @override
  _VerifyMobileNumberWidgetState createState() =>
      _VerifyMobileNumberWidgetState();
}

class _VerifyMobileNumberWidgetState extends State<VerifyMobileNumberWidget> {
  TextEditingController otpController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF5F5F5),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 40),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 60,
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomerLoginWidget(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Text(
                  'Verify Mobile Number',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.title3.override(
                    fontFamily: 'Lato',
                    color: FlutterFlowTheme.primaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 60),
              child: Text(
                'Please enter the digit 4 digit SMS\nverification code we sent to your \nmobile number.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Lato',
                  color: Color(0xFF707070),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: Color(0x00EEEEEE),
              ),
              child: TextFormField(
                controller: otpController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter OTP',
                  hintStyle: FlutterFlowTheme.title3.override(
                    fontFamily: 'Lato',
                    color: Color(0xFFB1B1B1),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: FlutterFlowTheme.title3,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Please enter OTP sent on your phone';
                  }
                  if (val.length < 6) {
                    return 'Invalid OTP!';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 60, 10, 60),
              child: FFButtonWidget(
                onPressed: () async {
                  if (!formKey.currentState.validate()) {
                    return;
                  }
                  if (otpController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Enter SMS verification code.'),
                      ),
                    );
                    return;
                  }
                  final phoneVerifiedUser = await verifySmsCode(
                    context: context,
                    smsCode: otpController.text,
                  );
                  if (phoneVerifiedUser == null) {
                    return;
                  }
                  if ((currentUserDisplayName) != '') {
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EnterYourInfoWidget(),
                      ),
                      (r) => false,
                    );
                  }
                  if ((currentUserDisplayName) == '') {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBarPage(initialPage: 'Home'),
                      ),
                    );
                  }
                },
                text: 'Verify Account',
                options: FFButtonOptions(
                  width: 200,
                  height: 40,
                  color: FlutterFlowTheme.secondaryColor,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Lato',
                    color: Colors.white,
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
