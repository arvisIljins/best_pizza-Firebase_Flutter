import 'package:firbase_example/modals/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // sign in anon
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirabaseUser
  User _userFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFirebaseUser);
  }

  // sign in with email & password
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // register with email & password

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
