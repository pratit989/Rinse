import '../backend/backend.dart';
import '../components/confirm_loacation_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentLocationWidget extends StatefulWidget {
  const CurrentLocationWidget({
    Key key,
    this.location,
  }) : super(key: key);

  final MapRecord location;

  @override
  _CurrentLocationWidgetState createState() => _CurrentLocationWidgetState();
}

class _CurrentLocationWidgetState extends State<CurrentLocationWidget> {
  LatLng currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng googleMapsCenter;
  Completer<GoogleMapController> googleMapsController;
  String adressOutput;

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
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
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
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
                      padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                      child: Text(
                        'Current Location',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Lato',
                          color: Color(0xFF073131),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FlutterFlowGoogleMap(
                controller: googleMapsController,
                onCameraIdle: (latLng) =>
                    setState(() => googleMapsCenter = latLng),
                initialLocation: googleMapsCenter ??= currentUserLocationValue,
                markers: [
                  if (widget.location != null)
                    FlutterFlowMarker(
                      widget.location.reference.path,
                      widget.location.latLng,
                      () async {
                        currentUserLocationValue = await getCurrentUserLocation(
                            defaultLocation: LatLng(0.0, 0.0));
                        adressOutput = await actions.getAddress(
                          currentUserLocationValue,
                        );
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: ConfirmLoacationWidget(
                                  locationSelected: currentUserLocationValue,
                                  address: adressOutput,
                                ),
                              ),
                            );
                          },
                        );

                        setState(() {});
                      },
                    ),
                ],
                markerColor: GoogleMarkerColor.red,
                mapType: MapType.normal,
                style: GoogleMapStyle.standard,
                initialZoom: 15,
                allowInteraction: true,
                allowZoom: true,
                showZoomControls: true,
                showLocation: true,
                showCompass: false,
                showMapToolbar: true,
                showTraffic: true,
                centerMapOnMarkerTap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
