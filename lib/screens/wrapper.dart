import 'package:firbase_example/modals/user.dart';
import 'package:firbase_example/screens/authenticate/authenticate.dart';
import 'package:firbase_example/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // print(user);

    //Retun either Home or Athenticate wiged
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
