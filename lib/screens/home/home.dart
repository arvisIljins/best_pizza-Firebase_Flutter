import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbase_example/screens/home/pizzaList.dart';
import 'package:firbase_example/services/auth.dart';
import 'package:firbase_example/services/databse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().pizza,
      child: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[400],
          title: Text(
            'Best Pizza',
            style: TextStyle(
              color: Colors.blueGrey[100],
            ),
          ),
          actions: [
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
                print('Loged out');
              },
              label: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.blueGrey[100],
                ),
              ),
              icon: Icon(
                Icons.login,
                color: Colors.blueGrey[100],
              ),
            ),
          ],
        ),
        body: PizzaList(),
      ),
    );
  }
}
