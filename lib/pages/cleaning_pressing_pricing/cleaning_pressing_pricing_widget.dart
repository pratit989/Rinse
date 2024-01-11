import '/backend/backend.dart';
import '/components/clothes_list_tab/clothes_list_tab_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/schedule_pickup/schedule_pickup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'cleaning_pressing_pricing_model.dart';
export 'cleaning_pressing_pricing_model.dart';

class CleaningPressingPricingWidget extends StatefulWidget {
  const CleaningPressingPricingWidget({super.key});

  @override
  _CleaningPressingPricingWidgetState createState() =>
      _CleaningPressingPricingWidgetState();
}

class _CleaningPressingPricingWidgetState
    extends State<CleaningPressingPricingWidget> {
  late CleaningPressingPricingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CleaningPressingPricingModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        automaticallyImplyLeading: false,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Color(0xFF1F4444),
            size: 24.0,
          ),
        ),
        title: Text(
          'Pricing',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                fontFamily: 'Lato',
                color: const Color(0xFF062222),
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              'assets/images/Asset_11.png',
              width: MediaQuery.sizeOf(context).width * 0.15,
              fit: BoxFit.contain,
            ),
            Text(
              'Cleaning & Pressing',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: StreamBuilder<List<PricingRecord>>(
                  stream: queryPricingRecord(
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<PricingRecord> listViewPricingRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final listViewPricingRecord =
                        listViewPricingRecordList.isNotEmpty
                            ? listViewPricingRecordList.first
                            : null;
                    return Builder(
                      builder: (context) {
                        final clothName =
                            listViewPricingRecord?.clothsList.toList() ?? [];
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: clothName.length,
                          itemBuilder: (context, clothNameIndex) {
                            final clothNameItem = clothName[clothNameIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: ClothesListTabWidget(
                                key: Key(
                                    'Keyq4e_${clothNameIndex}_of_${clothName.length}'),
                                clothName: clothNameItem,
                                pricePerPiece: listViewPricingRecord
                                    ?.clothsPriceList.length,
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
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 0),
                      reverseDuration: const Duration(milliseconds: 0),
                      child: const SchedulePickupWidget(),
                    ),
                  );
                },
                text: 'BOOK NOW',
                options: FFButtonOptions(
                  width: 150.0,
                  height: 35.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Open Sans',
                        color: FlutterFlowTheme.of(context).tertiary,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                  elevation: 2.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ].addToStart(const SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
