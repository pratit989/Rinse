import '/flutter_flow/flutter_flow_util.dart';
import 'enter_your_info_widget.dart' show EnterYourInfoWidget;
import 'package:flutter/material.dart';

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

  @override
  void initState(BuildContext context) {
    firstNameInputControllerValidator = _firstNameInputControllerValidator;
    lastNameInputControllerValidator = _lastNameInputControllerValidator;
    emailInputControllerValidator = _emailInputControllerValidator;
  }

  @override
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
