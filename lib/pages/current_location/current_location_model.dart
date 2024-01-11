import '/backend/backend.dart';
import '/components/confirm_loacation/confirm_loacation_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'current_location_widget.dart' show CurrentLocationWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CurrentLocationModel extends FlutterFlowModel<CurrentLocationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for ConfirmLoacation component.
  late ConfirmLoacationModel confirmLoacationModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    confirmLoacationModel = createModel(context, () => ConfirmLoacationModel());
  }

  void dispose() {
    confirmLoacationModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
