import '../backend/backend.dart';
import '../components/clothes_list_tab_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../schedule_pickup/schedule_pickup_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CleaningPressingPricingWidget extends StatefulWidget {
  const CleaningPressingPricingWidget({Key key}) : super(key: key);

  @override
  _CleaningPressingPricingWidgetState createState() =>
      _CleaningPressingPricingWidgetState();
}

class _CleaningPressingPricingWidgetState
    extends State<CleaningPressingPricingWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
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
              'assets/images/Asset_11.png',
              width: MediaQuery.of(context).size.width * 0.15,
              fit: BoxFit.contain,
            ),
            Text(
              'Cleaning & Pressing',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: StreamBuilder<List<PricingRecord>>(
                  stream: queryPricingRecord(
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
                    List<PricingRecord> listViewPricingRecordList =
                        snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final listViewPricingRecord =
                        listViewPricingRecordList.isNotEmpty
                            ? listViewPricingRecordList.first
                            : null;
                    return Builder(
                      builder: (context) {
                        final clothName = listViewPricingRecord.clothsList
                                .toList()
                                ?.toList() ??
                            [];
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: clothName.length,
                          itemBuilder: (context, clothNameIndex) {
                            final clothNameItem = clothName[clothNameIndex];
                            return Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.tertiaryColor,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    color: Color(0x19000000),
                                    offset: Offset(0, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ClothesListTabWidget(
                                clothName: clothNameItem,
                                pricePerPiece: listViewPricingRecord
                                    .clothsPriceList
                                    .toList()
                                    .length,
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
