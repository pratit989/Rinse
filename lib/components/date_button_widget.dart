import 'package:flutter/material.dart';

import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';

class DateButtonWidget extends StatefulWidget {
  const DateButtonWidget({Key key}) : super(key: key);

  @override
  _DateButtonWidgetState createState() => _DateButtonWidgetState();
}

class _DateButtonWidgetState extends State<DateButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final dateMonthDay = (functions.integerListGenerator(12)?.toList() ?? []).take(12).toList();
        return ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: dateMonthDay.length,
          itemBuilder: (context, dateMonthDayIndex) {
            final dateMonthDayItem = dateMonthDay[dateMonthDayIndex];
            return Container(
              height: 100,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.3,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if ((FFAppState().selectedDateDayMonth) != (dateMonthDayItem))
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                      child: InkWell(
                        onTap: () => setState(() {
                            FFAppState().selectedDateDayMonth = dateMonthDayItem;
                            DateTime time = DateTime.now();
                            FFAppState().pickupDateDayMonth = DateTime(
                                time.year,
                                FFAppState().monthToIntMapper[functions.listDateMonthDay('Month', dateMonthDayItem)],
                                int.parse(functions.listDateMonthDay('Date', dateMonthDayItem)),
                                time.hour,
                                time.minute,
                                time.second,
                                time.millisecond,
                                time.microsecond);
                            print(FFAppState().pickupDateDayMonth);
                          }),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color(0xFF707070),
                              width: 0.1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(30, 5, 30, 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  functions.listDateMonthDay('Date', dateMonthDayItem),
                                  style: FlutterFlowTheme.title1.override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.secondaryColor,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  functions.listDateMonthDay('Month', dateMonthDayItem),
                                  style: FlutterFlowTheme.title3.override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.secondaryColor,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  functions.listDateMonthDay('Day', dateMonthDayItem),
                                  style: FlutterFlowTheme.title3.override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.secondaryColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  if ((FFAppState().selectedDateDayMonth) == (dateMonthDayItem))
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFF707070),
                            width: 0.1,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 5, 30, 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                functions.listDateMonthDay('Date', dateMonthDayItem),
                                style: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Lato',
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                functions.listDateMonthDay('Month', dateMonthDayItem),
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Lato',
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                functions.listDateMonthDay('Day', dateMonthDayItem),
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Lato',
                                  color: Colors.white,
                                  fontSize: 18,
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
