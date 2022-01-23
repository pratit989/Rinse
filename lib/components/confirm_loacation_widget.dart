import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/lat_lng.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmLoacationWidget extends StatefulWidget {
  const ConfirmLoacationWidget({
    Key key,
    this.locationSelected,
    this.address,
  }) : super(key: key);

  final LatLng locationSelected;
  final String address;

  @override
  _ConfirmLoacationWidgetState createState() => _ConfirmLoacationWidgetState();
}

class _ConfirmLoacationWidgetState extends State<ConfirmLoacationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.tertiaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.address,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lato',
                    color: Color(0xFF073131),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Confirm Location',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lato',
                    color: FlutterFlowTheme.secondaryColor,
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
