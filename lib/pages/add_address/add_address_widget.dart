import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/current_location/current_location_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'add_address_model.dart';
export 'add_address_model.dart';

class AddAddressWidget extends StatefulWidget {
  const AddAddressWidget({super.key});

  @override
  _AddAddressWidgetState createState() => _AddAddressWidgetState();
}

class _AddAddressWidgetState extends State<AddAddressWidget>
    with TickerProviderStateMixin {
  late AddAddressModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddAddressModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode6 ??= FocusNode();

    _model.textController7 ??= TextEditingController();
    _model.textFieldFocusNode7 ??= FocusNode();

    _model.textController8 ??= TextEditingController();
    _model.textFieldFocusNode8 ??= FocusNode();

    _model.textController9 ??= TextEditingController();
    _model.textFieldFocusNode9 ??= FocusNode();

    _model.textController10 ??= TextEditingController();
    _model.textFieldFocusNode10 ??= FocusNode();

    _model.textController11 ??= TextEditingController();
    _model.textFieldFocusNode11 ??= FocusNode();

    _model.textController12 ??= TextEditingController();
    _model.textFieldFocusNode12 ??= FocusNode();
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
          'Add Address',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                fontFamily: 'Lato',
                color: const Color(0xFF062222),
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Align(
            alignment: const Alignment(0.0, 0),
            child: TabBar(
              labelColor: FlutterFlowTheme.of(context).primary,
              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lato',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
              unselectedLabelStyle: const TextStyle(),
              indicatorColor: const Color(0xFFCD355F),
              indicatorWeight: 1.0,
              tabs: const [
                Tab(
                  text: 'Home',
                ),
                Tab(
                  text: 'Office',
                ),
                Tab(
                  text: 'Other',
                ),
              ],
              controller: _model.tabBarController,
              onTap: (i) async {
                [() async {}, () async {}, () async {}][i]();
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _model.tabBarController,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: StreamBuilder<List<MapRecord>>(
                        stream: queryMapRecord(
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
                          List<MapRecord> buttonMapRecordList = snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final buttonMapRecord = buttonMapRecordList.isNotEmpty
                              ? buttonMapRecordList.first
                              : null;
                          return FFButtonWidget(
                            onPressed: () async {
                              currentUserLocationValue =
                                  await getCurrentUserLocation(
                                      defaultLocation: const LatLng(0.0, 0.0));

                              await buttonMapRecord!.reference
                                  .update(createMapRecordData(
                                latLng: currentUserLocationValue,
                              ));
                              await actions.getAddress(
                                currentUserLocationValue!,
                              );
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 0),
                                  reverseDuration: const Duration(milliseconds: 0),
                                  child: CurrentLocationWidget(
                                    location: buttonMapRecord,
                                  ),
                                ),
                              );
                            },
                            text: 'Get Current Location',
                            icon: const Icon(
                              Icons.my_location,
                              size: 18.0,
                            ),
                            options: FFButtonOptions(
                              width: 347.0,
                              height: 32.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                              elevation: 2.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _model.textController1,
                              focusNode: _model.textFieldFocusNode1,
                              autofillHints: const [AutofillHints.streetAddressLine1],
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Flat / House No. / Society',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFC0C0C0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: const Color(0xFF818181),
                                    fontSize: 13.0,
                                  ),
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.streetAddress,
                              validator: _model.textController1Validator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _model.textController2,
                              focusNode: _model.textFieldFocusNode2,
                              autofillHints: const [AutofillHints.streetAddressLine2],
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Street / Area',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFC0C0C0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: const Color(0xFF818181),
                                    fontSize: 13.0,
                                  ),
                              keyboardType: TextInputType.streetAddress,
                              validator: _model.textController2Validator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _model.textController3,
                              focusNode: _model.textFieldFocusNode3,
                              autofillHints: const [AutofillHints.addressCity],
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: const InputDecoration(
                                isDense: true,
                                hintText: 'District / City / State',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFC0C0C0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: const Color(0xFF818181),
                                    fontSize: 13.0,
                                  ),
                              keyboardType: TextInputType.streetAddress,
                              validator: _model.textController3Validator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 20.0),
                            child: TextFormField(
                              controller: _model.textController4,
                              focusNode: _model.textFieldFocusNode4,
                              autofillHints: const [AutofillHints.postalCode],
                              textInputAction: TextInputAction.done,
                              obscureText: false,
                              decoration: const InputDecoration(
                                isDense: true,
                                hintText: 'Pin Code',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFC0C0C0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: const Color(0xFF818181),
                                    fontSize: 13.0,
                                  ),
                              maxLength: 6,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              buildCounter: (context,
                                      {required currentLength,
                                      required isFocused,
                                      maxLength}) =>
                                  null,
                              keyboardType: TextInputType.number,
                              validator: _model.textController4Validator
                                  .asValidator(context),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Proceed',
                        options: FFButtonOptions(
                          width: 200.0,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Image.asset(
                        'assets/images/Mask_Group_1.png',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.465,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 0),
                              reverseDuration: const Duration(milliseconds: 0),
                              child: const CurrentLocationWidget(),
                            ),
                          );
                        },
                        text: 'Get Current Location',
                        icon: const Icon(
                          Icons.my_location,
                          size: 18.0,
                        ),
                        options: FFButtonOptions(
                          width: 347.0,
                          height: 32.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontSize: 14.0,
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
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _model.textController5,
                              focusNode: _model.textFieldFocusNode5,
                              autofillHints: const [AutofillHints.streetAddressLine1],
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Flat / House No. / Society',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFC0C0C0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: const Color(0xFF818181),
                                    fontSize: 13.0,
                                  ),
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.streetAddress,
                              validator: _model.textController5Validator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _model.textController6,
                              focusNode: _model.textFieldFocusNode6,
                              autofillHints: const [AutofillHints.streetAddressLine2],
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Street / Area',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFC0C0C0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: const Color(0xFF818181),
                                    fontSize: 13.0,
                                  ),
                              keyboardType: TextInputType.streetAddress,
                              validator: _model.textController6Validator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _model.textController7,
                              focusNode: _model.textFieldFocusNode7,
                              autofillHints: const [AutofillHints.addressCity],
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: const InputDecoration(
                                isDense: true,
                                hintText: 'District / City / State',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFC0C0C0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: const Color(0xFF818181),
                                    fontSize: 13.0,
                                  ),
                              keyboardType: TextInputType.streetAddress,
                              validator: _model.textController7Validator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 20.0),
                            child: TextFormField(
                              controller: _model.textController8,
                              focusNode: _model.textFieldFocusNode8,
                              autofillHints: const [AutofillHints.postalCode],
                              textInputAction: TextInputAction.done,
                              obscureText: false,
                              decoration: const InputDecoration(
                                isDense: true,
                                hintText: 'Pin Code',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFC0C0C0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: const Color(0xFF818181),
                                    fontSize: 13.0,
                                  ),
                              maxLength: 6,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              buildCounter: (context,
                                      {required currentLength,
                                      required isFocused,
                                      maxLength}) =>
                                  null,
                              keyboardType: TextInputType.number,
                              validator: _model.textController8Validator
                                  .asValidator(context),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Proceed',
                        options: FFButtonOptions(
                          width: 200.0,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Image.asset(
                        'assets/images/Mask_Group_1.png',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.465,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 0),
                              reverseDuration: const Duration(milliseconds: 0),
                              child: const CurrentLocationWidget(),
                            ),
                          );
                        },
                        text: 'Get Current Location',
                        icon: const Icon(
                          Icons.my_location,
                          size: 18.0,
                        ),
                        options: FFButtonOptions(
                          width: 347.0,
                          height: 32.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontSize: 14.0,
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
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _model.textController9,
                              focusNode: _model.textFieldFocusNode9,
                              autofillHints: const [AutofillHints.streetAddressLine1],
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Flat / House No. / Society',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFC0C0C0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: const Color(0xFF818181),
                                    fontSize: 13.0,
                                  ),
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.streetAddress,
                              validator: _model.textController9Validator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _model.textController10,
                              focusNode: _model.textFieldFocusNode10,
                              autofillHints: const [AutofillHints.streetAddressLine2],
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Street / Area',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFC0C0C0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: const Color(0xFF818181),
                                    fontSize: 13.0,
                                  ),
                              keyboardType: TextInputType.streetAddress,
                              validator: _model.textController10Validator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _model.textController11,
                              focusNode: _model.textFieldFocusNode11,
                              autofillHints: const [AutofillHints.addressCity],
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: const InputDecoration(
                                isDense: true,
                                hintText: 'District / City / State',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFC0C0C0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: const Color(0xFF818181),
                                    fontSize: 13.0,
                                  ),
                              keyboardType: TextInputType.streetAddress,
                              validator: _model.textController11Validator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 20.0),
                            child: TextFormField(
                              controller: _model.textController12,
                              focusNode: _model.textFieldFocusNode12,
                              autofillHints: const [AutofillHints.postalCode],
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.done,
                              obscureText: false,
                              decoration: const InputDecoration(
                                isDense: true,
                                hintText: 'Pin Code',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFC0C0C0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: const Color(0xFF818181),
                                    fontSize: 13.0,
                                  ),
                              maxLength: 6,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              buildCounter: (context,
                                      {required currentLength,
                                      required isFocused,
                                      maxLength}) =>
                                  null,
                              keyboardType: TextInputType.number,
                              validator: _model.textController12Validator
                                  .asValidator(context),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Proceed',
                        options: FFButtonOptions(
                          width: 200.0,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Image.asset(
                        'assets/images/Mask_Group_1.png',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.465,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}