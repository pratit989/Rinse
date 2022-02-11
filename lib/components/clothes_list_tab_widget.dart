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
    this.onAddToCartPressed,
    this.index,
  }) : super(key: key);

  final String clothName;
  final int pricePerPiece;
  final VoidCallback onAddToCartPressed;
  final int index;

  @override
  _ClothesListTabWidgetState createState() => _ClothesListTabWidgetState();
}

class _ClothesListTabWidgetState extends State<ClothesListTabWidget> {
  int countControllerValue;
  bool addToCartVisibility;
  int index;
  String _serviceType;

  @override
  void initState() {
    // TODO: implement initState
    index = widget.index;
    _serviceType = FFAppState().serviceSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        fontSize: 14,
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
                Visibility(
                  visible: _serviceType == 'Cleaning & Pressing'
                      ? FFAppState().cleaningPressingCartItems[index] != null
                          ? FFAppState().cleaningPressingCartItems[index][2] == 0
                              ? true
                              : false
                          : true
                      : FFAppState().pressingCartItems[index] != null
                          ? FFAppState().pressingCartItems[index][2] == 0
                              ? true
                              : false
                          : true,
                  replacement: Container(
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
                      count: _serviceType == 'Cleaning & Pressing'
                          ? FFAppState().cleaningPressingCartItems[index] != null
                              ? FFAppState().cleaningPressingCartItems[index][2]
                              : 0
                          : FFAppState().pressingCartItems[index] != null
                              ? FFAppState().pressingCartItems[index][2]
                              : 0,
                      updateCount: (count) => setState(() {
                        count == 0 ? addToCartVisibility = true : addToCartVisibility = false;
                        return _serviceType == 'Cleaning & Pressing'
                            ? FFAppState().cleaningPressingCartItems[index][2] = count
                            : FFAppState().pressingCartItems[index][2] = count;
                      }),
                      stepSize: 1,
                      minimum: 0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        setState(() {
                          addToCartVisibility = false;
                          widget.onAddToCartPressed();
                        });
                      },
                      text: 'Add to cart',
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 10,
                      ),
                      options: FFButtonOptions(
                        width: MediaQuery.of(context).size.width*0.3,
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
