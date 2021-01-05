import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        title: Text('Best Pizza'),
        actions: [
          FlatButton.icon(
            onPressed: () {},
            label: Text('Logout'),
            icon: Icon(Icons.login),
          ),
        ],
      ),
    );
  }
}
