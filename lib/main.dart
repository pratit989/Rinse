import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rinse/admin_recieved_orders/admin_received_orders_widget.dart';
import 'package:rinse/backend/backend.dart';
import 'package:rinse/welcome/welcome_widget.dart';
import 'package:rinse/worker_home/worker_home_widget.dart';

import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'auth/auth_util.dart';
import 'auth/firebase_user_provider.dart';
import 'customer_my_orders/customer_my_orders_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'home/home_widget.dart';
import 'pricing/pricing_widget.dart';
import 'profile/profile_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<RinseFirebaseUser> userStream;
  RinseFirebaseUser initialUser;
  bool displaySplashImage = true;
  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = rinseFirebaseUserStream()..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rinse',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null || displaySplashImage
          ? Container(
              color: Colors.transparent,
              child: Builder(
                builder: (context) => Image.asset(
                  'assets/images/launch_img.png',
                  fit: BoxFit.cover,
                ),
              ),
            )
          : currentUser.loggedIn
              ? StreamBuilder<UsersRecord>(
                  stream: authenticatedUserStream,
                  builder: (context, snapshot) {
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
                    UsersRecord currentUserRecord = snapshot.data;
                    return currentUserRecord.userType == 'Customer'
                        ? CustomerNavBarPage()
                        : currentUserRecord.userType == 'Worker'
                            ? WorkerHomeWidget()
                            : AdminNavBarPage();
                  })
              : WelcomeWidget(),
    );
  }
}

class AdminNavBarPage extends StatefulWidget {
  AdminNavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _AdminNavBarPageState createState() => _AdminNavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _AdminNavBarPageState extends State<AdminNavBarPage> {
  String _currentPage = 'ReceivedOrders';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'ReceivedOrders': AdminReceivedOrdersWidget(),
      'Pricing': PricingWidget(),
      'SignOut': signOut,
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    if (currentIndex == 2) {
      signOut();
      return WelcomeWidget();
    } else {
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
              Icons.logout,
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
}

class CustomerNavBarPage extends StatefulWidget {
  CustomerNavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _CustomerNavBarPageState createState() => _CustomerNavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _CustomerNavBarPageState extends State<CustomerNavBarPage> {
  String _currentPage = 'Home';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Home': HomeWidget(),
      'CustomerMyOrders': CustomerMyOrdersWidget(),
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
              Icons.home_outlined,
              size: 28,
            ),
            activeIcon: Icon(
              Icons.home_rounded,
              size: 28,
            ),
            label: '•',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
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
