import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // sign in anon
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in with email & password
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // register with email & password

  // sign out
}

mixin AuthResult {}
