// Flutter
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rinse/Screens/CreateAccount.dart';
import 'package:rinse/Screens/NavBarBody.dart';
import 'package:rinse/Screens/Welcome.dart';


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
          return MultiProvider(
                providers: [
                  Provider<FirebaseAuth>(create: (_) => FirebaseAuth.instance),
                ],
                builder: (context, child) {
                  return StreamProvider<User?>(
                    create: (_) => context.read<FirebaseAuth>().authStateChanges(),
                    initialData: null,
                    child: MaterialApp(
                      title: 'Rinse',
                      theme: ThemeData(
                        brightness: Brightness.light,
                        inputDecorationTheme: InputDecorationTheme(border: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(31, 68, 68, 1)))),
                        colorScheme: ColorScheme.fromSwatch().copyWith(
                            brightness: Brightness.light,
                            primary: Color.fromRGBO(7, 49, 49, 1),
                            secondary: Color.fromRGBO(202, 85, 100, 1),
                            background: Color.fromRGBO(230, 230, 230, 1),
                            surface: Color.fromRGBO(240, 240, 240, 1)),
                      ),
                      home: Consumer<User?>(
                        builder: (context, user, _) {
                          if (user != null) {
                            if (user.displayName != null) {
                              return NavBarBody();
                            } else {
                              return CreateAccount();
                            }
                          } else {
                            return Welcome();
                          }
                        },
                      ),
                      routes: {},
                    ),
                  );
                });
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator(
          color: Colors.blue,
        );
      },
    );
  }
}
