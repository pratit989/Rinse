import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';

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
  List<TextEditingController> _controller = List.generate(12, (i) => TextEditingController(), growable: false);

  @override
  void initState() {
    super.initState();
    addressParts = FFAppState().homeAddress?.split(' | ') ?? [];
    addressParts.addAll(FFAppState().officeAddress?.split(' | ') ?? []);
    addressParts.addAll(FFAppState().otherAddress?.split(' | ') ?? []);
    int count = 0;
    for (TextEditingController _editor in _controller) {
      _editor.text = addressParts[count] ?? '';
      count += 1;
    }
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
                                          _controller[0].text = addressParts[0] ?? '';
                                          _controller[1].text = addressParts[1] ?? '';
                                          _controller[2].text = addressParts[2] ?? '';
                                          _controller[3].text = addressParts[3] ?? '';
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
                                          controller: _controller[0],
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
                                          controller: _controller[1],
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
                                          controller: _controller[2],
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
                                          controller: _controller[3],
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
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Address Changed Successfully")));
                                      setState(() {
                                        FFAppState().homeAddress = '${_controller[0].text} | ${_controller[1].text} | ${_controller[2].text} | ${_controller[3].text}';
                                        if (FFAppState().homeAddress.replaceAll(' | ', '').isEmpty) {
                                          Navigator.pop(context);
                                        } else {
                                          FFAppState().deliveryAddress =  FFAppState().homeAddress.replaceAll(' | ', '');
                                          Navigator.pop(context, Icons.home_sharp);
                                        }
                                      });
                                    },
                                    text: 'Change Address',
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
                              Expanded(
                                child: Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                  child: Image.asset(
                                    'assets/images/Mask_Group_1.png',
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                  ),
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
                                            _controller[4].text = addressParts[0] ?? '';
                                            _controller[5].text = addressParts[1] ?? '';
                                            _controller[6].text = addressParts[2] ?? '';
                                            _controller[7].text = addressParts[3] ?? '';
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
                                          controller: _controller[4],
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
                                          controller: _controller[5],
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
                                          controller: _controller[6],
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
                                          controller: _controller[7],
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
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Address Changed Successfully")));
                                      setState(() {
                                        FFAppState().officeAddress = '${_controller[4].text} | ${_controller[5].text} | ${_controller[6].text} | ${_controller[7].text}';
                                        FFAppState().deliveryAddress = FFAppState().officeAddress.replaceAll(' | ', '');
                                        if (FFAppState().officeAddress.replaceAll(' | ', '').isEmpty) {
                                          Navigator.pop(context);
                                        } else {
                                          FFAppState().deliveryAddress =  FFAppState().officeAddress.replaceAll(' | ', '');
                                          Navigator.pop(context, Icons.apartment_sharp);
                                        }
                                      });
                                    },
                                    text: 'Change Address',
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
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                    child: Image.asset(
                                      'assets/images/Mask_Group_1.png',
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width,
                                    ),
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
                                            _controller[8].text = addressParts[0] ?? '';
                                            _controller[9].text = addressParts[1] ?? '';
                                            _controller[10].text = addressParts[2] ?? '';
                                            _controller[11].text = addressParts[3] ?? '';
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
                                          controller: _controller[8],
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
                                          controller: _controller[9],
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
                                          controller: _controller[10],
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
                                          controller: _controller[11],
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
                                    onPressed: () async {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Address Changed Successfully")));
                                      setState(() {
                                        FFAppState().otherAddress = '${_controller[8].text} | ${_controller[9].text} | ${_controller[10].text} | ${_controller[11].text}';
                                        FFAppState().deliveryAddress = FFAppState().otherAddress.replaceAll(' | ', '');
                                        if (FFAppState().otherAddress.replaceAll(' | ', '').isEmpty) {
                                          Navigator.pop(context);
                                        } else {
                                          FFAppState().deliveryAddress =  FFAppState().otherAddress.replaceAll(' | ', '');
                                          Navigator.pop(context, Icons.location_on_sharp);
                                        }
                                      });
                                    },
                                    text: 'Change Address',
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
                                Expanded(
                                  child: Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                    child: Image.asset(
                                      'assets/images/Mask_Group_1.png',
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width,
                                    ),
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
