import 'package:firbase_example/screens/wrapper.dart';
import 'package:firbase_example/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modals/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
