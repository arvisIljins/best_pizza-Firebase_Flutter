import 'package:firbase_example/services/auth.dart';
import 'package:firbase_example/shared/constants.dart';

import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleShowSignIn;
  SignIn(this.toggleShowSignIn);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field states
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        title: Text('Sign in - Best Pizza',
            style: TextStyle(
              color: Colors.blueGrey[100],
            )),
        actions: [
          FlatButton(
            onPressed: () {
              widget.toggleShowSignIn();
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.blueGrey[100],
              ),
            ),
          ),
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  cursorColor: Colors.blueGrey[400],
                  decoration:
                      textInputDecorations.copyWith(labelText: 'Your email'),
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an password' : null,
                  cursorColor: Colors.blueGrey[400],
                  decoration:
                      textInputDecorations.copyWith(labelText: 'Your password'),
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  color: Colors.blueGrey[400],
                  child: Text('Sign in',
                      style: TextStyle(
                        color: Colors.blueGrey[100],
                      )),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() =>
                            error = 'Please check your email and password');
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 15),
                )
              ],
            ),
          )),
    );
  }
}
