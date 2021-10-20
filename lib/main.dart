// Flutter
import 'package:flutter/material.dart';
// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:rinse/Screens/Login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> _initialiseFirebaseWithAppCheck() {
    return Firebase.initializeApp().then((value) {
      FirebaseAppCheck.instance.activate(webRecaptchaSiteKey: 'recaptcha-v3-site-key');
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialiseFirebaseWithAppCheck(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Container(
              child: Center(
                child: Text("There was an issue initialising Firebase. "
                    "The following Error occurred: ${snapshot.error}"),
              ),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Rinse',
            theme: ThemeData(
              primarySwatch: Colors.grey,
              inputDecorationTheme: InputDecorationTheme(
                border: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(31, 68, 68, 1)))
              ),
            ),
            home: Login(),
            routes: {},
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator(
          color: Colors.blue,
        );
      },
    );
  }
}
