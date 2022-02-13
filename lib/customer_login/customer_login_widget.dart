
import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../verify_mobile_number/verify_mobile_number_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class CustomerLoginWidget extends StatefulWidget {
  const CustomerLoginWidget({Key key}) : super(key: key);

  @override
  _CustomerLoginWidgetState createState() => _CustomerLoginWidgetState();
}

class _CustomerLoginWidgetState extends State<CustomerLoginWidget> {
  TextEditingController phoneNumberController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool pressed = false;

  @override
  void initState() {
    super.initState();
    pressed = false;
    phoneNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Image.asset(
                      'assets/images/CustomerLogin.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.845,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 55, 40, 30),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0, 1.06),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                    color: Color(0x00EEEEEE),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0,0,10,0),
                                            child: Container(
                                              width: MediaQuery.of(context).size.width*0.12,
                                              child: TextFormField(
                                                initialValue: "+91",
                                                enabled: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  disabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                      FlutterFlowTheme.primaryColor,
                                                      width: 0.7,
                                                    ),
                                                    borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(4.0),
                                                      topRight: Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                      FlutterFlowTheme.primaryColor,
                                                      width: 0.7,
                                                    ),
                                                    borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(4.0),
                                                      topRight: Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style: FlutterFlowTheme.title3.override(
                                                  fontFamily: 'Lato',
                                                  color: FlutterFlowTheme.primaryColor,
                                                ),
                                                keyboardType: TextInputType.phone,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width*0.5,
                                            child: TextFormField(
                                              onChanged: (_) => EasyDebounce.debounce(
                                                'phoneNumberController',
                                                Duration(milliseconds: 2000),
                                                () => setState(() {}),
                                              ),
                                              controller: phoneNumberController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                        FlutterFlowTheme.primaryColor,
                                                    width: 0.7,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft: Radius.circular(4.0),
                                                    topRight: Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                        FlutterFlowTheme.primaryColor,
                                                    width: 0.7,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft: Radius.circular(4.0),
                                                    topRight: Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style: FlutterFlowTheme.title3.override(
                                                fontFamily: 'Lato',
                                                color: FlutterFlowTheme.primaryColor,
                                              ),
                                              keyboardType: TextInputType.phone,
                                              validator: (val) {
                                                if (val.isEmpty) {
                                                  return 'Enter your phone number to Login or Signup';
                                                }
                                                if (val.length < 10) {
                                                  return 'Please enter a valid phone number';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1, -0.8),
                                child: pressed ? Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: FlutterFlowTheme.secondaryColor
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: CircularProgressIndicator(color: Colors.white,),
                                  ),
                                ) : FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 50,
                                  fillColor: FlutterFlowTheme.secondaryColor,
                                  icon: Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: Color(0xFFFBFBFB),
                                    size: 25,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      pressed = true;
                                    });
                                    if (phoneNumberController.text.isEmpty) {
                                      setState(() => pressed = false);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Phone Number is required.'),
                                        ),
                                      );
                                      return;
                                    } else if (phoneNumberController.text.length != 10) {
                                      setState(() => pressed = false);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Please enter a valid 10 digit Phone Number.'),
                                        ),
                                      );
                                      return;
                                    }
                                    if (!formKey.currentState.validate()) {
                                      setState(() => pressed = false);
                                      return;
                                    }
                                    await beginPhoneAuth(
                                      context: context,
                                      phoneNumber: '+91${phoneNumberController.text}',
                                      onCodeSent: () async {
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                VerifyMobileNumberWidget(),
                                          ),
                                          (r) => false,
                                        );
                                      },
                                    ).then((value) => setState(() => pressed = false)).onError((error, stackTrace) => setState(() => pressed = false));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
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
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
