import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class PizzaList extends StatefulWidget {
  @override
  _PizzaListState createState() => _PizzaListState();
}

class _PizzaListState extends State<PizzaList> {
  @override
  Widget build(BuildContext context) {
    final pizza = Provider.of<QuerySnapshot>(context);
    for (var doc in pizza.documents) {
      print(doc.data);
    }

    return Container();
  }
}
