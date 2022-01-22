import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

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
  bool addToCartVisibility;

  @override
  Widget build(BuildContext context) {
    FFAppState().cartItems.contains(widget.clothName) ? addToCartVisibility = false : addToCartVisibility = true;
    return Container(
      width: 353,
      height: 77,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.tertiaryColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x14000000),
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(10),
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
                      fontSize: 14,
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
                        fontSize: 15,
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
            Stack(
              alignment: AlignmentDirectional(0, 0),
              children: [
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
                      Icons.indeterminate_check_box_rounded,
                      color: enabled ? FlutterFlowTheme.secondaryColor : Color(0xFFEEEEEE),
                      size: 25,
                    ),
                    incrementIconBuilder: (enabled) => Icon(
                      Icons.add_box_rounded,
                      color: enabled ? FlutterFlowTheme.secondaryColor : Color(0xFFEEEEEE),
                      size: 25,
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
                    updateCount: (count) {
                      setState(() => countControllerValue = count);
                      if (count == 0) {
                        FFAppState().cartItems.remove(widget.clothName);
                        addToCartVisibility = true;
                      }
                    },
                    stepSize: 1,
                    minimum: 0,
                  ),
                ),
                Visibility(
                  visible: addToCartVisibility,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        setState(() {
                          FFAppState().cartItems.add(widget.clothName);
                          countControllerValue += 1;
                        });
                      },
                      text: 'Add to cart',
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 10,
                      ),
                      options: FFButtonOptions(
                        width: 110,
                        height: 25,
                        color: FlutterFlowTheme.secondaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Lato',
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
