import 'package:provider/provider.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../current_location/current_location_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAddressWidget extends StatefulWidget {
  const AddAddressWidget({Key key}) : super(key: key);

  @override
  _AddAddressWidgetState createState() => _AddAddressWidgetState();
}

class _AddAddressWidgetState extends State<AddAddressWidget> {
  LatLng currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String addressOfLocation;
  List<String> addressParts = [];
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  TextEditingController textController5;
  TextEditingController textController6;
  TextEditingController textController7;
  TextEditingController textController8;
  TextEditingController textController10;
  TextEditingController textController9;
  TextEditingController textController11;
  TextEditingController textController12;

  @override
  void initState() {
    super.initState();
    addressParts = FFAppState().homeAddress?.split(' | ') ?? [];
    addressParts.addAll(FFAppState().officeAddress?.split(' | ') ?? []);
    addressParts.addAll(FFAppState().otherAddress?.split(' | ') ?? []);
    textController1 = TextEditingController();
    textController1.text = addressParts[0] ?? '';
    textController2 = TextEditingController();
    textController2.text = addressParts[1] ?? '';
    textController3 = TextEditingController();
    textController3.text = addressParts[2] ?? '';
    textController4 = TextEditingController();
    textController4.text = addressParts[3] ?? '';
    textController5 = TextEditingController();
    textController5.text = addressParts[4] ?? '';
    textController6 = TextEditingController();
    textController6.text = addressParts[5] ?? '';
    textController7 = TextEditingController();
    textController7.text = addressParts[6] ?? '';
    textController8 = TextEditingController();
    textController8.text = addressParts[7] ?? '';
    textController9 = TextEditingController();
    textController9.text = addressParts[8] ?? '';
    textController10 = TextEditingController();
    textController10.text = addressParts[9] ?? '';
    textController11 = TextEditingController();
    textController11.text = addressParts[10] ?? '';
    textController12 = TextEditingController();
    textController12.text = addressParts[11] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
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
                      padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                      child: Text(
                        'Add Address',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Lato',
                          color: Color(0xFF062222),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: FlutterFlowTheme.primaryColor,
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      indicatorColor: Color(0xFFCD355F),
                      indicatorWeight: 1,
                      tabs: [
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
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 20),
                                child: StreamBuilder<List<MapRecord>>(
                                  stream: queryMapRecord(
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
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    List<MapRecord> buttonMapRecordList =
                                        snapshot.data;
                                    // Return an empty Container when the document does not exist.
                                    if (snapshot.data.isEmpty) {
                                      return Container();
                                    }
                                    final buttonMapRecord =
                                        buttonMapRecordList.isNotEmpty
                                            ? buttonMapRecordList.first
                                            : null;
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        currentUserLocationValue =
                                            await getCurrentUserLocation(
                                                defaultLocation:
                                                    LatLng(0.0, 0.0));
                                        final mapUpdateData =
                                            createMapRecordData(
                                          latLng: currentUserLocationValue,
                                        );
                                        await buttonMapRecord.reference
                                            .update(mapUpdateData);
                                        addressOfLocation =
                                        await actions.getAddress(
                                          currentUserLocationValue,
                                        );
                                        setState(() {
                                          addressParts = addressOfLocation.split(' | ') ?? [];
                                          textController1.text = addressParts[0] ?? '';
                                          textController2.text = addressParts[1] ?? '';
                                          textController3.text = addressParts[2] ?? '';
                                          textController4.text = addressParts[3] ?? '';
                                        });
                                        // await Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         CurrentLocationWidget(
                                        //       location: buttonMapRecord,
                                        //       addressOutput: addressOfLocation, onConfirmPressed: () {
                                        //         setState(() {
                                        //           addressParts = FFAppState().homeAddress?.split(' | ') ?? [];
                                        //           textController3.text = addressParts[2] ?? '';
                                        //         });
                                        //         },
                                        //     ),
                                        //   ),
                                        // );
                                        },
                                        text: 'Get Current Location',
                                        icon: Icon(
                                          Icons.my_location,
                                          size: 18,
                                        ),
                                        options: FFButtonOptions(
                                          width: 347,
                                          height: 32,
                                          color: FlutterFlowTheme.primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.subtitle2.override(
                                            fontFamily: 'Lato',
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: TextFormField(
                                          controller: textController1,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText:
                                                'Flat / House No. / Society',
                                            hintStyle: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF818181),
                                              fontSize: 13,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                          ),
                                          style:
                                              FlutterFlowTheme.bodyText1.override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF818181),
                                            fontSize: 13,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: TextFormField(
                                          controller: textController2,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText: 'Street / Area',
                                            hintStyle: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF818181),
                                              fontSize: 13,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                          ),
                                          style:
                                              FlutterFlowTheme.bodyText1.override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF818181),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: TextFormField(
                                          controller: textController3,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText: 'District / City / State',
                                            hintStyle: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF818181),
                                              fontSize: 13,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style:
                                              FlutterFlowTheme.bodyText1.override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF818181),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 20),
                                        child: TextFormField(
                                          controller: textController4,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText: 'Pin Code',
                                            hintStyle: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF818181),
                                              fontSize: 13,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style:
                                              FlutterFlowTheme.bodyText1.override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF818181),
                                            fontSize: 13,
                                          ),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      setState(() {
                                        FFAppState().homeAddress = '${textController1.text} | ${textController2.text} | ${textController3.text} | ${textController4.text}';
                                        Navigator.pop(context);
                                      });
                                    },
                                    text: 'Save Address',
                                    options: FFButtonOptions(
                                      width: 200,
                                      height: 40,
                                      color: FlutterFlowTheme.secondaryColor,
                                      textStyle:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Lato',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                  child: Image.asset(
                                    'assets/images/Mask_Group_1.png',
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 20),
                                  child: StreamBuilder<List<MapRecord>>(
                                    stream: queryMapRecord(
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
                                              color:
                                              FlutterFlowTheme.primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<MapRecord> buttonMapRecordList =
                                          snapshot.data;
                                      // Return an empty Container when the document does not exist.
                                      if (snapshot.data.isEmpty) {
                                        return Container();
                                      }
                                      final buttonMapRecord =
                                      buttonMapRecordList.isNotEmpty
                                          ? buttonMapRecordList.first
                                          : null;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          currentUserLocationValue =
                                          await getCurrentUserLocation(
                                              defaultLocation:
                                              LatLng(0.0, 0.0));
                                          final mapUpdateData =
                                          createMapRecordData(
                                            latLng: currentUserLocationValue,
                                          );
                                          await buttonMapRecord.reference
                                              .update(mapUpdateData);
                                          addressOfLocation =
                                          await actions.getAddress(
                                            currentUserLocationValue,
                                          );
                                          setState(() {
                                            addressParts = addressOfLocation.split(' | ') ?? [];
                                            textController5.text = addressParts[0] ?? '';
                                            textController6.text = addressParts[1] ?? '';
                                            textController7.text = addressParts[2] ?? '';
                                            textController8.text = addressParts[3] ?? '';
                                          });
                                          // await Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) =>
                                          //         CurrentLocationWidget(
                                          //       location: buttonMapRecord,
                                          //       addressOutput: addressOfLocation, onConfirmPressed: () {
                                          //         setState(() {
                                          //           addressParts = FFAppState().homeAddress?.split(' | ') ?? [];
                                          //           textController3.text = addressParts[2] ?? '';
                                          //         });
                                          //         },
                                          //     ),
                                          //   ),
                                          // );
                                        },
                                        text: 'Get Current Location',
                                        icon: Icon(
                                          Icons.my_location,
                                          size: 18,
                                        ),
                                        options: FFButtonOptions(
                                          width: 347,
                                          height: 32,
                                          color: FlutterFlowTheme.primaryColor,
                                          textStyle:
                                          FlutterFlowTheme.subtitle2.override(
                                            fontFamily: 'Lato',
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: TextFormField(
                                          controller: textController5,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText:
                                                'Flat / House No. / Society',
                                            hintStyle: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF818181),
                                              fontSize: 13,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                          ),
                                          style:
                                              FlutterFlowTheme.bodyText1.override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF818181),
                                            fontSize: 13,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: TextFormField(
                                          controller: textController6,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText: 'Street / Area',
                                            hintStyle: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF818181),
                                              fontSize: 13,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                          ),
                                          style:
                                              FlutterFlowTheme.bodyText1.override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF818181),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: TextFormField(
                                          controller: textController7,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText: 'District / City / State',
                                            hintStyle: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF818181),
                                              fontSize: 13,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style:
                                              FlutterFlowTheme.bodyText1.override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF818181),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 20),
                                        child: TextFormField(
                                          controller: textController8,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText: 'Pin Code',
                                            hintStyle: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF818181),
                                              fontSize: 13,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style:
                                              FlutterFlowTheme.bodyText1.override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF818181),
                                            fontSize: 13,
                                          ),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      setState(() {
                                        FFAppState().officeAddress = '${textController5.text} | ${textController6.text} | ${textController7.text} | ${textController8.text}';
                                        Navigator.pop(context);
                                      });
                                    },
                                    text: 'Save Address',
                                    options: FFButtonOptions(
                                      width: 200,
                                      height: 40,
                                      color: FlutterFlowTheme.secondaryColor,
                                      textStyle:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Lato',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                  child: Image.asset(
                                    'assets/images/Mask_Group_1.png',
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 20),
                                  child: StreamBuilder<List<MapRecord>>(
                                    stream: queryMapRecord(
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
                                              color:
                                              FlutterFlowTheme.primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<MapRecord> buttonMapRecordList =
                                          snapshot.data;
                                      // Return an empty Container when the document does not exist.
                                      if (snapshot.data.isEmpty) {
                                        return Container();
                                      }
                                      final buttonMapRecord =
                                      buttonMapRecordList.isNotEmpty
                                          ? buttonMapRecordList.first
                                          : null;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          currentUserLocationValue =
                                          await getCurrentUserLocation(
                                              defaultLocation:
                                              LatLng(0.0, 0.0));
                                          final mapUpdateData =
                                          createMapRecordData(
                                            latLng: currentUserLocationValue,
                                          );
                                          await buttonMapRecord.reference
                                              .update(mapUpdateData);
                                          addressOfLocation =
                                          await actions.getAddress(
                                            currentUserLocationValue,
                                          );
                                          setState(() {
                                            addressParts = addressOfLocation.split(' | ') ?? [];
                                            textController9.text = addressParts[0] ?? '';
                                            textController10.text = addressParts[1] ?? '';
                                            textController11.text = addressParts[2] ?? '';
                                            textController12.text = addressParts[3] ?? '';
                                          });
                                          // await Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) =>
                                          //         CurrentLocationWidget(
                                          //       location: buttonMapRecord,
                                          //       addressOutput: addressOfLocation, onConfirmPressed: () {
                                          //         setState(() {
                                          //           addressParts = FFAppState().homeAddress?.split(' | ') ?? [];
                                          //           textController3.text = addressParts[2] ?? '';
                                          //         });
                                          //         },
                                          //     ),
                                          //   ),
                                          // );
                                        },
                                        text: 'Get Current Location',
                                        icon: Icon(
                                          Icons.my_location,
                                          size: 18,
                                        ),
                                        options: FFButtonOptions(
                                          width: 347,
                                          height: 32,
                                          color: FlutterFlowTheme.primaryColor,
                                          textStyle:
                                          FlutterFlowTheme.subtitle2.override(
                                            fontFamily: 'Lato',
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: TextFormField(
                                          controller: textController9,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText:
                                                'Flat / House No. / Society',
                                            hintStyle: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF818181),
                                              fontSize: 13,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                          ),
                                          style:
                                              FlutterFlowTheme.bodyText1.override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF818181),
                                            fontSize: 13,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: TextFormField(
                                          controller: textController10,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText: 'Street / Area',
                                            hintStyle: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF818181),
                                              fontSize: 13,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                          ),
                                          style:
                                              FlutterFlowTheme.bodyText1.override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF818181),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: TextFormField(
                                          controller: textController11,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText: 'District / City / State',
                                            hintStyle: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF818181),
                                              fontSize: 13,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style:
                                              FlutterFlowTheme.bodyText1.override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF818181),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 20),
                                        child: TextFormField(
                                          controller: textController12,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText: 'Pin Code',
                                            hintStyle: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF818181),
                                              fontSize: 13,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC0C0C0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style:
                                              FlutterFlowTheme.bodyText1.override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF818181),
                                            fontSize: 13,
                                          ),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      setState(() {
                                        FFAppState().otherAddress = '${textController9.text} | ${textController10.text} | ${textController11.text} | ${textController12.text}';
                                        Navigator.pop(context);
                                      });
                                    },
                                    text: 'Save Address',
                                    options: FFButtonOptions(
                                      width: 200,
                                      height: 40,
                                      color: FlutterFlowTheme.secondaryColor,
                                      textStyle:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Lato',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                  child: Image.asset(
                                    'assets/images/Mask_Group_1.png',
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
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
                ),
              ),
            ],
          ),
        ),
      );
  }
}
