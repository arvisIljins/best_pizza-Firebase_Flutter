import 'package:firbase_example/modals/user.dart';
import 'package:firbase_example/services/databse.dart';
import 'package:firbase_example/shared/constants.dart';
import 'package:firbase_example/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> pizzaTypes = [
    'Cheese Pizza',
    'Margarita',
    'Hawaii with bacon',
    'Vegetarian Pizza',
    'Exotic Pizza',
    'City Pizza',
    'New York Pizza',
    'Italian Pizza',
    'Sweet Pizza',
  ];
  String _currentName;
  String _currentAddress;
  String _currentPizzaType;
  int _currentSize = 15;
  bool _currentExtraCheese = false;

  CurrentExtraCheeseNow() {
    return _currentExtraCheese ? 'Yes' : 'No';
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Container(
                child: ListView(
                  children: [
                    Text(
                      'Update your pizza choice.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blueGrey[400],
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: userData.name,
                      validator: (val) =>
                          val.isEmpty ? 'Enter your name' : null,
                      cursorColor: Colors.blueGrey[400],
                      decoration:
                          textInputDecorations.copyWith(labelText: 'Name'),
                      onChanged: (val) {
                        setState(() => _currentName = val);
                      },
                    ),
                    TextFormField(
                      initialValue: userData.address,
                      validator: (val) =>
                          val.isEmpty ? 'Enter your address' : null,
                      cursorColor: Colors.blueGrey[400],
                      decoration:
                          textInputDecorations.copyWith(labelText: 'Address'),
                      onChanged: (val) {
                        setState(() => _currentAddress = val);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField(
                      value: userData.pizzaType ?? _currentPizzaType,
                      decoration: textInputDecorations,
                      items: pizzaTypes.map((pizzaType) {
                        return DropdownMenuItem(
                          value: pizzaType,
                          child: Text(
                            pizzaType,
                            style: TextStyle(
                              color: Colors.blueGrey[400],
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() => _currentPizzaType = val);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Pizza size? (${_currentSize} cm)',
                        style: TextStyle(
                            color: Colors.blueGrey[400],
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    Slider(
                      activeColor: Colors.blueGrey[400],
                      inactiveColor: Colors.blueGrey[200],
                      value: (_currentSize ?? userData.size).toDouble(),
                      min: 15,
                      max: 25,
                      divisions: 2,
                      label: _currentSize.round().toString(),
                      onChanged: (val) {
                        setState(() => _currentSize = val.round());
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          'Do you wanna extra cheese? (${CurrentExtraCheeseNow()})',
                          style: TextStyle(
                              color: Colors.blueGrey[400],
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Checkbox(
                            value: _currentExtraCheese,
                            checkColor: Colors.blueGrey[100],
                            activeColor: Colors.blueGrey[400],
                            onChanged: (bool value) {
                              setState(() {
                                _currentExtraCheese = value;
                              });
                            }),
                      ],
                    ),
                    RaisedButton(
                      color: Colors.blueGrey[400],
                      child: Text('Update',
                          style: TextStyle(
                            color: Colors.blueGrey[100],
                          )),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentPizzaType ?? userData.pizzaType,
                              _currentName ?? userData.name,
                              _currentAddress ?? userData.address,
                              _currentSize ?? userData.size,
                              _currentExtraCheese ?? userData.extraCheese);

                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
