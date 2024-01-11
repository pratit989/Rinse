import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'clothes_list_tab_model.dart';
export 'clothes_list_tab_model.dart';

class ClothesListTabWidget extends StatefulWidget {
  const ClothesListTabWidget({
    Key? key,
    this.clothName,
    this.pricePerPiece,
  }) : super(key: key);

  final String? clothName;
  final int? pricePerPiece;

  @override
  _ClothesListTabWidgetState createState() => _ClothesListTabWidgetState();
}

class _ClothesListTabWidgetState extends State<ClothesListTabWidget> {
  late ClothesListTabModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClothesListTabModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 353.0,
      height: 77.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).tertiary,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x14000000),
            offset: Offset(0.0, 2.0),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                  child: Text(
                    widget.clothName!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lato',
                          color: Color(0xFF073131),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '₹ ${widget.pricePerPiece?.toString()}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: Color(0xFF818181),
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '/ per piece',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: Color(0xFF818181),
                            fontSize: 10.0,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional(0.0, 0.0),
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(2.0),
                      topLeft: Radius.circular(2.0),
                      topRight: Radius.circular(2.0),
                    ),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).tertiary,
                      width: 0.0,
                    ),
                  ),
                  child: FlutterFlowCountController(
                    decrementIconBuilder: (enabled) => Icon(
                      Icons.indeterminate_check_box_rounded,
                      color: enabled
                          ? FlutterFlowTheme.of(context).secondary
                          : Color(0xFFEEEEEE),
                      size: 25.0,
                    ),
                    incrementIconBuilder: (enabled) => Icon(
                      Icons.add_box_rounded,
                      color: enabled
                          ? FlutterFlowTheme.of(context).secondary
                          : Color(0xFFEEEEEE),
                      size: 25.0,
                    ),
                    countBuilder: (count) => Text(
                      count.toString(),
                      style: GoogleFonts.getFont(
                        'Roboto',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    count: _model.countControllerValue ??= 0,
                    updateCount: (count) =>
                        setState(() => _model.countControllerValue = count),
                    stepSize: 1,
                    minimum: 0,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      FFAppState().update(() {
                        FFAppState().addToCartItems(widget.clothName!);
                      });
                    },
                    text: 'Add to cart',
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 10.0,
                    ),
                    options: FFButtonOptions(
                      width: 110.0,
                      height: 25.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Lato',
                                color: Colors.white,
                                fontSize: 10.0,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
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
