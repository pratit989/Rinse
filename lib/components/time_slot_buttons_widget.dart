import 'package:flutter/material.dart';

import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';

class TimeSlotButtonsWidget extends StatefulWidget {
  const TimeSlotButtonsWidget({Key key}) : super(key: key);

  @override
  _TimeSlotButtonsWidgetState createState() => _TimeSlotButtonsWidgetState();
}

class _TimeSlotButtonsWidgetState extends State<TimeSlotButtonsWidget> {
  final DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final timeCardNumber = (functions.integerListGenerator(6)?.toList() ?? []).take(6).toList();
        return GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 0,
            childAspectRatio: 2,
          ),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: timeCardNumber.length,
          itemBuilder: (context, timeCardNumberIndex) {
            final timeCardNumberItem = timeCardNumber[timeCardNumberIndex];
            return Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Stack(
                children: [
                  if ((functions.timeCardVisiblityCheck(timeCardNumberItem)) == true)
                    InkWell(
                      onTap: () async {
                        setState(() {
                          FFAppState().selectedTimeCard =
                              '${functions.timeGiver(timeCardNumberItem, 'Start')} - ${functions.timeGiver(timeCardNumberItem, 'End')}';
                          print(FFAppState().selectedTimeCard);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFFC0C0C0),
                            width: 0.5,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              functions.timeGiver(timeCardNumberItem, 'Start'),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lato',
                                color: Color(0xFFCA5564),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              ' - ',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lato',
                                color: Color(0xFFCA5564),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              functions.timeGiver(timeCardNumberItem, 'End'),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lato',
                                color: Color(0xFFCA5564),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if ((functions.timeCardVisiblityCheck(timeCardNumberItem)) == false)
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Color(0xFF707070),
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            functions.timeGiver(timeCardNumberItem, 'Start'),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                              color: Color(0xFFBBBBBB),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            ' - ',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                              color: Color(0xFFBBBBBB),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            functions.timeGiver(timeCardNumberItem, 'End'),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                              color: Color(0xFFBBBBBB),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if ((functions.timeCardVisiblityCheck(timeCardNumberItem)) == true &&
                      ('${functions.timeGiver(timeCardNumberItem, 'Start')} - ${functions.timeGiver(timeCardNumberItem, 'End')}') ==
                          (FFAppState().selectedTimeCard))
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Color(0xFFC0C0C0),
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            functions.timeGiver(timeCardNumberItem, 'Start'),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            ' - ',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            functions.timeGiver(timeCardNumberItem, 'End'),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
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
