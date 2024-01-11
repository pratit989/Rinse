import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAaMtY26zNd9nVW-Zv1Yzch9IQ5pn5RVO4",
            authDomain: "rinse-8a4f5.firebaseapp.com",
            projectId: "rinse-8a4f5",
            storageBucket: "rinse-8a4f5.appspot.com",
            messagingSenderId: "993217774202",
            appId: "1:993217774202:web:2eddd1c7578e89b832b1c3",
            measurementId: "G-E60E7WDFRH"));
  } else {
    await Firebase.initializeApp();
  }
}
