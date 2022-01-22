import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ClothesListTabWidget extends StatefulWidget {
  const ClothesListTabWidget({
    Key key,
    this.clothName,
    this.pricePerPiece,
  }) : super(key: key);

  final String clothName;
  final int pricePerPiece;

  @override
  _ClothesListTabWidgetState createState() => _ClothesListTabWidgetState();
}

class _ClothesListTabWidgetState extends State<ClothesListTabWidget> {
  int countControllerValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.tertiaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                  child: Text(
                    widget.clothName,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lato',
                      color: Color(0xFF073131),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '₹ ${widget.pricePerPiece.toString()}',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        color: Color(0xFF818181),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '/ per piece',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        color: Color(0xFF818181),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(2),
                  topLeft: Radius.circular(2),
                  topRight: Radius.circular(2),
                ),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: FlutterFlowTheme.tertiaryColor,
                  width: 0,
                ),
              ),
              child: FlutterFlowCountController(
                decrementIconBuilder: (enabled) => Icon(
                  Icons.delete,
                  color: enabled
                      ? FlutterFlowTheme.secondaryColor
                      : Color(0xFFEEEEEE),
                  size: 20,
                ),
                incrementIconBuilder: (enabled) => FaIcon(
                  FontAwesomeIcons.plus,
                  color: enabled
                      ? FlutterFlowTheme.secondaryColor
                      : Color(0xFFEEEEEE),
                  size: 20,
                ),
                countBuilder: (count) => Text(
                  count.toString(),
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                count: countControllerValue ??= 0,
                updateCount: (count) =>
                    setState(() => countControllerValue = count),
                stepSize: 1,
                minimum: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
