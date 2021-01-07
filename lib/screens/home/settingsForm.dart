import 'package:firbase_example/shared/constants.dart';
import 'package:flutter/material.dart';

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
  bool extraCheese = false;

  @override
  Widget build(BuildContext context) {
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
              validator: (val) => val.isEmpty ? 'Enter your name' : null,
              cursorColor: Colors.blueGrey[400],
              decoration: textInputDecorations.copyWith(labelText: 'Name'),
              obscureText: true,
              onChanged: (val) {
                setState(() => _currentName = val);
              },
            ),
            TextFormField(
              validator: (val) => val.isEmpty ? 'Enter your address' : null,
              cursorColor: Colors.blueGrey[400],
              decoration: textInputDecorations.copyWith(labelText: 'Address'),
              obscureText: true,
              onChanged: (val) {
                setState(() => _currentAddress = val);
              },
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
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
            Text('Pizza size?',
                style: TextStyle(
                    color: Colors.blueGrey[400],
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            Slider(
              activeColor: Colors.blueGrey[400],
              inactiveColor: Colors.blueGrey[200],
              value: (_currentSize ?? 25).toDouble(),
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
                  'Do you wanna extra cheese?',
                  style: TextStyle(
                      color: Colors.blueGrey[400],
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Checkbox(
                    value: extraCheese,
                    checkColor: Colors.blueGrey[100],
                    activeColor: Colors.blueGrey[400],
                    onChanged: (bool value) {
                      setState(() {
                        extraCheese = value;
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
                print(_currentAddress);
                print(_currentName);
                print(extraCheese);
                print(_currentPizzaType);
                print(_currentSize);
              },
            ),
          ],
        ),
      ),
    );
  }
}
