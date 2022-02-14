import 'package:rinse/backend/backend.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class ReceivedConfirmationBoxWidget extends StatefulWidget {
  const ReceivedConfirmationBoxWidget({Key key, @required this.documentReference}) : super(key: key);
  final DocumentReference documentReference;

  @override
  _ReceivedConfirmationBoxWidgetState createState() => _ReceivedConfirmationBoxWidgetState();
}

class _ReceivedConfirmationBoxWidgetState extends State<ReceivedConfirmationBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: Color(0xF6073131),
      ),
      child: Align(
        alignment: AlignmentDirectional(0, 0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                child: Text(
                  'Order Received from worker',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lato',
                    color: Color(0xFF818181),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Text(
                  'Confirmation?',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await FirebaseFirestore.instance.runTransaction((transaction) async{
                          // Order Reads
                          DocumentReference orderRef = widget.documentReference;
                          DocumentSnapshot orderSnapshot = await transaction.get(orderRef);
                          Map<String, dynamic> orderData = orderSnapshot.data();
                          // User Reads
                          DocumentReference userRef = UsersRecord.collection.doc(orderData['assigned_worker']);
                          // Remember to do all the writes at the End
                          transaction.update(userRef, {
                            'accepted_order' : null
                          });
                          transaction.update(orderRef, {
                            'assigned_worker' : null
                          });
                        });

                        final doc = await OrdersRecord.getDocumentOnce(widget.documentReference);
                        if (doc.assignedWorker == null) {
                          return Navigator.pop(context);
                        }
                      },
                      text: 'YES',
                      options: FFButtonOptions(
                        width: 100,
                        height: 30,
                        color: Color(0xFF073131),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Lato',
                          color: Colors.white,
                          fontSize: 9,
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
                  FFButtonWidget(
                    onPressed: () async {
                      await FirebaseFirestore.instance.runTransaction((transaction) async{
                        // Order Reads
                        DocumentReference orderRef = widget.documentReference;
                        DocumentSnapshot orderSnapshot = await transaction.get(orderRef);
                        Map<String, dynamic> orderData = orderSnapshot.data();
                        String status = orderData.containsKey('admin_order_status') ? orderData['admin_order_status'] : null;
                        // Remember to do all the writes at the End
                        transaction.update(orderRef,{
                          'admin_order_status' : status ?? null
                        });
                      });
                      final doc = await OrdersRecord.getDocumentOnce(widget.documentReference);
                      if (doc.assignedWorker != null) {
                        return Navigator.pop(context);
                      }
                    },
                    text: 'NO',
                    options: FFButtonOptions(
                      width: 100,
                      height: 35,
                      color: FlutterFlowTheme.tertiaryColor,
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Lato',
                        color: Colors.black,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                      borderSide: BorderSide(
                        color: Color(0xFF707070),
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
