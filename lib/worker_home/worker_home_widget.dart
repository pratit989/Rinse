import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rinse/auth/auth_util.dart';
import 'package:rinse/backend/backend.dart';
import 'package:rinse/ongoing_delivered_to_customer/ongoing_delivered_to_customer_widget.dart';
import 'package:rinse/ongoing_delivered_to_laundry/ongoing_delivered_to_laundry_widget.dart';
import 'package:rinse/pickup_order_details/pickup_order_details_widget.dart';
import 'package:rinse/pricing/pricing_widget.dart';
import 'package:rinse/profile/profile_widget.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../new_orders/new_orders_widget.dart';
import '../packed_orders/packed_orders_widget.dart';

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
                    if (currentUserDocument.acceptedOrder == '' || currentUserDocument.acceptedOrder == null) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WorkerNavBarPage(
                                  pageType: "pickupFromCustomer",
                                  initialPage: 'NewOrders',
                                )),
                      );
                    }
                    final OrdersRecord ordersRecord =
                        await OrdersRecord.getDocumentOnce(OrdersRecord.collection.doc(currentUserDocument.acceptedOrder));
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (ordersRecord.adminOrderStatus == '' || ordersRecord.adminOrderStatus == null)
                              ? OngoingDeliveredToLaundryWidget(
                                  documentReference: OrdersRecord.collection.doc(currentUserDocument.acceptedOrder),
                                )
                              : (ordersRecord.adminOrderStatus == 'Packed')
                                  ? PickupOrderDetailsWidget(documentReference: OrdersRecord.collection.doc(currentUserDocument.acceptedOrder))
                                  : (ordersRecord.adminOrderStatus == 'OutForDelivery')
                                      ? OngoingDeliveredToCustomerWidget(
                                          documentReference: OrdersRecord.collection.doc(currentUserDocument.acceptedOrder))
                                      : Container()),
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
                    if (currentUserDocument.acceptedOrder == '' || currentUserDocument.acceptedOrder == null) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkerNavBarPage(
                            pageType: "pickupFromLaundry",
                            initialPage: 'PackedOrders',
                          ),
                        ),
                      );
                    }
                    final OrdersRecord ordersRecord =
                    await OrdersRecord.getDocumentOnce(OrdersRecord.collection.doc(currentUserDocument.acceptedOrder));
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (ordersRecord.adminOrderStatus == '' || ordersRecord.adminOrderStatus == null)
                              ? OngoingDeliveredToLaundryWidget(
                            documentReference: OrdersRecord.collection.doc(currentUserDocument.acceptedOrder),
                          )
                              : (ordersRecord.adminOrderStatus == 'Packed')
                              ? PickupOrderDetailsWidget(documentReference: OrdersRecord.collection.doc(currentUserDocument.acceptedOrder))
                              : (ordersRecord.adminOrderStatus == 'OutForDelivery')
                              ? OngoingDeliveredToCustomerWidget(
                              documentReference: OrdersRecord.collection.doc(currentUserDocument.acceptedOrder))
                              : Container()),
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

class WorkerNavBarPage extends StatefulWidget {
  WorkerNavBarPage({Key key, this.initialPage, this.pageType}) : super(key: key);

  final String initialPage;
  final String pageType;

  @override
  _WorkerNavBarPageState createState() => _WorkerNavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _WorkerNavBarPageState extends State<WorkerNavBarPage> {
  String _currentPage = '';
  String _pageType;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
    _pageType = widget.pageType;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = _pageType == "pickupFromCustomer"
        ? {
            'NewOrders': NewOrdersWidget(),
            'Pricing': PricingWidget(),
            'Profile': ProfileWidget(),
          }
        : {
            'PackedOrders': PackedOrdersWidget(),
            'Pricing': PricingWidget(),
            'Profile': ProfileWidget(),
          };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: Colors.white,
        selectedItemColor: FlutterFlowTheme.primaryColor,
        unselectedItemColor: Color(0x8A000000),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.clipboard,
              size: 23,
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.clipboardList,
              size: 23,
            ),
            label: '•',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.loyalty_outlined,
              size: 25,
            ),
            activeIcon: Icon(
              Icons.loyalty_rounded,
              size: 25,
            ),
            label: '•',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: '•',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
