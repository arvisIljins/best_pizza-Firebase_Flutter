import 'package:firbase_example/services/auth.dart';

import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        title: Text('Best Pizza',
            style: TextStyle(
              color: Colors.blueGrey[100],
            )),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.blueGrey[400],
                  decoration: InputDecoration(
                    labelText: 'Your email',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey[400],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey[400]),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey[400],
                        width: 2,
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey[400]),
                    ),
                  ),
                  onChanged: (val) {},
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.blueGrey[400],
                  decoration: InputDecoration(
                    labelText: 'Your password',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey[400],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey[400]),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey[400],
                        width: 2,
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey[400]),
                    ),
                  ),
                  obscureText: true,
                  onChanged: (val) {},
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
                  onPressed: () async {},
                ),
              ],
            ),
          )),
    );
  }
}
