import 'package:firbase_example/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        title: Text(
          'Best Pizza',
        ),
        actions: [
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
              print('Loged out');
            },
            label: Text('Logout'),
            icon: Icon(Icons.login),
          ),
        ],
      ),
    );
  }
}
