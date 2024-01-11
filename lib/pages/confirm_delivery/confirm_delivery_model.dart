import '/flutter_flow/flutter_flow_util.dart';
import 'confirm_delivery_widget.dart' show ConfirmDeliveryWidget;
import 'package:flutter/material.dart';

class ConfirmDeliveryModel extends FlutterFlowModel<ConfirmDeliveryWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
