import 'package:firbase_example/services/auth.dart';
import 'package:firbase_example/shared/constants.dart';
import 'package:firbase_example/shared/loading.dart';
import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  final Function toggleShowSignIn;
  UserRegister(this.toggleShowSignIn);

  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field states
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.blueGrey[100],
            appBar: AppBar(
              backgroundColor: Colors.blueGrey[400],
              title: Text('Sign Up - Best Pizza',
                  style: TextStyle(
                    color: Colors.blueGrey[100],
                  )),
              actions: [
                FlatButton(
                  onPressed: () {
                    widget.toggleShowSignIn();
                  },
                  child: Text(
                    'Sign In',
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
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        cursorColor: Colors.blueGrey[400],
                        decoration: textInputDecorations.copyWith(
                            labelText: 'Your email'),
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (val) => val.length <= 6
                            ? 'Password needs to be at least 6 characters long'
                            : null,
                        cursorColor: Colors.blueGrey[400],
                        decoration: textInputDecorations.copyWith(
                            labelText: 'Your password'),
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
                        child: Text('Register',
                            style: TextStyle(
                              color: Colors.blueGrey[100],
                            )),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(
                                  () => error = 'Please supply a valid email');
                              loading = false;
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
