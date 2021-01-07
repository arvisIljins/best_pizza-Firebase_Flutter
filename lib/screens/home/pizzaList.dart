import 'package:firbase_example/modals/pizza.dart';
import 'package:firbase_example/screens/home/pizzaTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PizzaList extends StatefulWidget {
  @override
  _PizzaListState createState() => _PizzaListState();
}

class _PizzaListState extends State<PizzaList> {
  @override
  Widget build(BuildContext context) {
    final pizza = Provider.of<List<Pizza>>(context) ?? [];
    /* pizza.forEach((pizza) {
      print(pizza.name);
      print(pizza.size);
      print(pizza.extraCheese);
    });*/

    return Container(
      color: Colors.blueGrey[100].withOpacity(0.5),
      child: ListView.builder(
        itemCount: pizza.length,
        itemBuilder: (context, index) {
          return PizzaTile(pizza: pizza[index]);
        },
      ),
    );
  }
}
