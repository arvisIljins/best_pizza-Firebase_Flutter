import 'package:firbase_example/screens/authenticate/signIn.dart';
import 'package:firbase_example/screens/authenticate/userRegister.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleShowSignIn() {
    setState(() => (showSignIn = !showSignIn));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (showSignIn
          ? SignIn(toggleShowSignIn)
          : UserRegister(toggleShowSignIn)),
    );
  }
}
