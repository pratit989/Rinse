import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../new_orders/new_orders_widget.dart';
import '../packed_orders/packed_orders_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkerHomeWidget extends StatefulWidget {
  const WorkerHomeWidget({Key key}) : super(key: key);

  @override
  _WorkerHomeWidgetState createState() => _WorkerHomeWidgetState();
}

class _WorkerHomeWidgetState extends State<WorkerHomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                  'Get Started!',
                  style: FlutterFlowTheme.title3.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.primaryColor,
                    fontSize: 28,
                  ),
                ),
              ),
              Text(
                'Select an option to proceed',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Lato',
                  color: Color(0xFF818181),
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewOrdersWidget(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/images/Group_937.png',
                    width: MediaQuery.of(context).size.width * 0.5,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PackedOrdersWidget(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/images/Group_938.png',
                    width: MediaQuery.of(context).size.width * 0.5,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
