import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/onboarding/verify_mobile_number/verify_mobile_number_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'customer_login_model.dart';
export 'customer_login_model.dart';

class CustomerLoginWidget extends StatefulWidget {
  const CustomerLoginWidget({super.key});

  @override
  _CustomerLoginWidgetState createState() => _CustomerLoginWidgetState();
}

class _CustomerLoginWidgetState extends State<CustomerLoginWidget> {
  late CustomerLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerLoginModel());

    _model.phoneNumberController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF5F5F5),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: const Color(0x00EEEEEE),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/LoginBackground.png',
                      ).image,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            icon: const Icon(
                              Icons.arrow_back_ios_sharp,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, -0.3),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 30.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 1.0),
                                  child: Text(
                                    'Enter Your \nMobile Number',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    child: TextFormField(
                                      controller: _model.phoneNumberController,
                                      focusNode: _model.phoneNumberFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.phoneNumberController',
                                        const Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      autofocus: true,
                                      autofillHints: const [
                                        AutofillHints.telephoneNumberNational
                                      ],
                                      textInputAction: TextInputAction.done,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: '+91',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 0.7,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0.7,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0.7,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0.7,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xFFDBDDDC),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      maxLength: 13,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      keyboardType: TextInputType.phone,
                                      validator: _model
                                          .phoneNumberControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [_model.phoneNumberMask],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, -1.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 50.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: Color(0xFFFBFBFB),
                                      size: 25.0,
                                    ),
                                    onPressed: () async {
                                      final phoneNumberVal =
                                          _model.phoneNumberController.text;
                                      if (phoneNumberVal.isEmpty ||
                                          !phoneNumberVal.startsWith('+')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Phone Number is required and has to start with +.'),
                                          ),
                                        );
                                        return;
                                      }
                                      await authManager.beginPhoneAuth(
                                        context: context,
                                        phoneNumber: phoneNumberVal,
                                        onCodeSent: (context) async {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  const Duration(milliseconds: 0),
                                              reverseDuration:
                                                  const Duration(milliseconds: 0),
                                              child: const VerifyMobileNumberWidget(),
                                            ),
                                            (r) => false,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ].divide(const SizedBox(height: 40.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}