import 'package:flutter/material.dart';

import '../backend/backend.dart';
import '../components/clothes_list_tab_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../schedule_pickup/schedule_pickup_widget.dart';

class PressingPricingWidget extends StatefulWidget {
  const PressingPricingWidget({Key key}) : super(key: key);

  @override
  _PressingPricingWidgetState createState() => _PressingPricingWidgetState();
}

class _PressingPricingWidgetState extends State<PressingPricingWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    FFAppState().serviceSelected = 'Pressing';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 50, 0),
                    child: InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Color(0xFF1F4444),
                        size: 24,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(70, 0, 0, 0),
                      child: Text(
                        'Pricing',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Lato',
                          color: Color(0xFF062222),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/PressingPricing.png',
              height: MediaQuery.of(context).size.height * 0.08,
              fit: BoxFit.contain,
            ),
            Text(
              'Pressing',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: StreamBuilder<List<PressingPricingRecord>>(
                  stream: queryPressingPricingRecord(
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.primaryColor,
                          ),
                        ),
                      );
                    }
                    List<PressingPricingRecord> listViewPressingPricingRecordList = snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final listViewPressingPricingRecord =
                        listViewPressingPricingRecordList.isNotEmpty ? listViewPressingPricingRecordList.first : null;
                    return Builder(
                      builder: (context) {
                        final clothName = listViewPressingPricingRecord.clothsList.toList()?.toList() ?? [];
                        final clothPrice = listViewPressingPricingRecord.clothsPriceList.toList()?.toList() ?? [];
                        return ListView.builder(
                          itemExtent: 80,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: clothName.length,
                          itemBuilder: (context, clothNameIndex) {
                            final clothNameItem = clothName[clothNameIndex];
                            final clothPriceItem = clothPrice[clothNameIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                              child: ClothesListTabWidget(
                                clothName: clothNameItem,
                                pricePerPiece: clothPriceItem,
                                index: clothNameIndex,
                                onAddToCartPressed: () => setState(() {
                                  FFAppState().pressingCartItems[clothNameIndex] = [clothName[clothNameIndex], clothPrice[clothNameIndex], 1];
                                }),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: FFButtonWidget(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SchedulePickupWidget(),
                    ),
                  );
                },
                text: 'BOOK NOW',
                options: FFButtonOptions(
                  width: 150,
                  height: 35,
                  color: FlutterFlowTheme.secondaryColor,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Open Sans',
                    color: FlutterFlowTheme.tertiaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
