import '/components/confirm_loacation/confirm_loacation_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'current_location_widget.dart' show CurrentLocationWidget;
import 'package:flutter/material.dart';

class CurrentLocationModel extends FlutterFlowModel<CurrentLocationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for ConfirmLoacation component.
  late ConfirmLoacationModel confirmLoacationModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    confirmLoacationModel = createModel(context, () => ConfirmLoacationModel());
  }

  @override
  void dispose() {
    confirmLoacationModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
