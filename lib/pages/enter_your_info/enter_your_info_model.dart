import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import 'enter_your_info_widget.dart' show EnterYourInfoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EnterYourInfoModel extends FlutterFlowModel<EnterYourInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for FirstNameInput widget.
  FocusNode? firstNameInputFocusNode;
  TextEditingController? firstNameInputController;
  String? Function(BuildContext, String?)? firstNameInputControllerValidator;
  String? _firstNameInputControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your first name';
    }

    return null;
  }

  // State field(s) for LastNameInput widget.
  FocusNode? lastNameInputFocusNode;
  TextEditingController? lastNameInputController;
  String? Function(BuildContext, String?)? lastNameInputControllerValidator;
  String? _lastNameInputControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your last name';
    }

    return null;
  }

  // State field(s) for EmailInput widget.
  FocusNode? emailInputFocusNode;
  TextEditingController? emailInputController;
  String? Function(BuildContext, String?)? emailInputControllerValidator;
  String? _emailInputControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your email';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    firstNameInputControllerValidator = _firstNameInputControllerValidator;
    lastNameInputControllerValidator = _lastNameInputControllerValidator;
    emailInputControllerValidator = _emailInputControllerValidator;
  }

  void dispose() {
    firstNameInputFocusNode?.dispose();
    firstNameInputController?.dispose();

    lastNameInputFocusNode?.dispose();
    lastNameInputController?.dispose();

    emailInputFocusNode?.dispose();
    emailInputController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
