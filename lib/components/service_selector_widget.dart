import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';

class ServiceSelectorWidget extends StatefulWidget {
  const ServiceSelectorWidget({Key key}) : super(key: key);

  @override
  _ServiceSelectorWidgetState createState() => _ServiceSelectorWidgetState();
}

class _ServiceSelectorWidgetState extends State<ServiceSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
      ),
      child: GridView(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 1.5,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            child: Stack(
              children: [
                if ((FFAppState().serviceSelected) != 'Cleaning & Pressing')
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            FFAppState().serviceSelected = 'Cleaning & Pressing';
                            print(FFAppState().serviceSelected);
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color(0xFF707070),
                              width: 0.5,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Text(
                              'Cleaning &\n   Pressing',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lato',
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if ((FFAppState().serviceSelected) == 'Cleaning & Pressing')
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFF707070),
                            width: 0.5,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            'Cleaning &\n   Pressing',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            child: Stack(
              children: [
                if ((FFAppState().serviceSelected) != 'Pressing')
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            FFAppState().serviceSelected = 'Pressing';
                            print(FFAppState().serviceSelected);
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color(0xFF707070),
                              width: 0.5,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Text(
                              ' Pressing',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lato',
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if ((FFAppState().serviceSelected) == 'Pressing')
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFF707070),
                            width: 0.5,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: AutoSizeText(
                            'Pressing',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
