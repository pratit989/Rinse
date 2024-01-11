import '/components/date_button/date_button_widget.dart';
import '/components/service_selector/service_selector_widget.dart';
import '/components/time_slot_buttons/time_slot_buttons_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'schedule_pickup_widget.dart' show SchedulePickupWidget;
import 'package:flutter/material.dart';

class SchedulePickupModel extends FlutterFlowModel<SchedulePickupWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DateButton component.
  late DateButtonModel dateButtonModel;
  // Model for TimeSlotButtons component.
  late TimeSlotButtonsModel timeSlotButtonsModel;
  // Model for ServiceSelector component.
  late ServiceSelectorModel serviceSelectorModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dateButtonModel = createModel(context, () => DateButtonModel());
    timeSlotButtonsModel = createModel(context, () => TimeSlotButtonsModel());
    serviceSelectorModel = createModel(context, () => ServiceSelectorModel());
  }

  @override
  void dispose() {
    dateButtonModel.dispose();
    timeSlotButtonsModel.dispose();
    serviceSelectorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
