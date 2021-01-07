import 'package:firbase_example/modals/pizza.dart';
import 'package:firbase_example/screens/home/pizzaList.dart';
import 'package:firbase_example/screens/home/settingsForm.dart';
import 'package:firbase_example/services/auth.dart';
import 'package:firbase_example/services/databse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
              height: 440,
              color: Colors.blueGrey[100],
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Pizza>>.value(
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
            Container(
              width: 35,
              child: FlatButton(
                onPressed: () => {_showSettingsPanel()},
                child: Icon(
                  Icons.edit,
                  color: Colors.blueGrey[100],
                ),
              ),
            ),
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
                //print('Loged out');
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
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bilde1.jpg'), fit: BoxFit.cover)),
            child: PizzaList()),
      ),
    );
  }
}
