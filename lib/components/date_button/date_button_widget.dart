import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'date_button_model.dart';
export 'date_button_model.dart';

class DateButtonWidget extends StatefulWidget {
  const DateButtonWidget({super.key});

  @override
  _DateButtonWidgetState createState() => _DateButtonWidgetState();
}

class _DateButtonWidgetState extends State<DateButtonWidget> {
  late DateButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DateButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        final dateMonthDay =
            functions.integerListGenerator(12).toList().take(12).toList();
        return ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: dateMonthDay.length,
          itemBuilder: (context, dateMonthDayIndex) {
            final dateMonthDayItem = dateMonthDay[dateMonthDayIndex];
            return Container(
              height: 100.0,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.3,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (FFAppState().selectedDateDayMonth != dateMonthDayItem)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          FFAppState().update(() {
                            FFAppState().selectedDateDayMonth =
                                dateMonthDayItem;
                            FFAppState().pickupDateDayMonth =
                                '${functions.listDateMonthDay('Day', dateMonthDayItem)} ${functions.listDateMonthDay('Month', dateMonthDayItem)} ${functions.listDateMonthDay('Day', dateMonthDayItem)}';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: const Color(0xFF707070),
                              width: 0.1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                30.0, 5.0, 30.0, 5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  functions.listDateMonthDay(
                                      'Date', dateMonthDayItem)!,
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  functions.listDateMonthDay(
                                      'Month', dateMonthDayItem)!,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 18.0,
                                      ),
                                ),
                                Text(
                                  functions.listDateMonthDay(
                                      'Day', dateMonthDayItem)!,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 18.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (FFAppState().selectedDateDayMonth == dateMonthDayItem)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: const Color(0xFF707070),
                            width: 0.1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 5.0, 30.0, 5.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                functions.listDateMonthDay(
                                    'Date', dateMonthDayItem)!,
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Text(
                                functions.listDateMonthDay(
                                    'Month', dateMonthDayItem)!,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                              ),
                              Text(
                                functions.listDateMonthDay(
                                    'Day', dateMonthDayItem)!,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
