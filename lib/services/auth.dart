import 'package:firbase_example/modals/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'databse.dart';

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

  //Sign in anonymos
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

  // sign in with email & password
  Future signInWithEmailAndPassword(String emaill, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: emaill, password: password);
      FirebaseUser user = result.user;
      return _userFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword(String emaill, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: emaill, password: password);
      FirebaseUser user = result.user;

//create a new document for the user with id
      await DatabaseService(uid: user.uid)
          .updateUserData('Pizza', 'Arvis', 25, true);

      return _userFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

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
