import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class RinseFirebaseUser {
  RinseFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

RinseFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RinseFirebaseUser> rinseFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<RinseFirebaseUser>((user) => currentUser = RinseFirebaseUser(user));
