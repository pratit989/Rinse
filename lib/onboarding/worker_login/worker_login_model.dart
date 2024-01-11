import '/flutter_flow/flutter_flow_util.dart';
import 'worker_login_widget.dart' show WorkerLoginWidget;
import 'package:flutter/material.dart';

class WorkerLoginModel extends FlutterFlowModel<WorkerLoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailInput widget.
  FocusNode? emailInputFocusNode;
  TextEditingController? emailInputController;
  String? Function(BuildContext, String?)? emailInputControllerValidator;
  String? _emailInputControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your first name';
    }

    return null;
  }

  // State field(s) for PasswordInput widget.
  FocusNode? passwordInputFocusNode;
  TextEditingController? passwordInputController;
  late bool passwordInputVisibility;
  String? Function(BuildContext, String?)? passwordInputControllerValidator;
  String? _passwordInputControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your last name';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    emailInputControllerValidator = _emailInputControllerValidator;
    passwordInputVisibility = false;
    passwordInputControllerValidator = _passwordInputControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailInputFocusNode?.dispose();
    emailInputController?.dispose();

    passwordInputFocusNode?.dispose();
    passwordInputController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
