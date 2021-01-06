import 'package:firbase_example/modals/pizza.dart';
import 'package:flutter/material.dart';

class PizzaTile extends StatelessWidget {
  final Pizza pizza;

  PizzaTile({this.pizza});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
          color: Colors.blueGrey[400],
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: pizza.size.toDouble(),
                    backgroundColor: Colors.blueGrey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        '${pizza.size.toString()} cm',
                        style: TextStyle(
                            color: Colors.blueGrey[400],
                            fontSize: 12,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(
                                Icons.local_pizza,
                                color: Colors.blueGrey[100],
                              ),
                            ),
                            Text(
                              pizza.pizzaType,
                              style: TextStyle(
                                  color: Colors.blueGrey[100],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        pizza.extraCheese
                            ? Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Icon(
                                      Icons.check_circle_sharp,
                                      color: Colors.blueGrey[100],
                                    ),
                                  ),
                                  Text(
                                    'Extra cheese',
                                    style: TextStyle(
                                        color: Colors.blueGrey[200],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Icon(
                                      Icons.not_interested,
                                      color: Colors.blueGrey[100],
                                    ),
                                  ),
                                  Text(
                                    'No Extra cheese',
                                    style: TextStyle(
                                        color: Colors.blueGrey[200],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(
                                Icons.person,
                                color: Colors.blueGrey[100],
                              ),
                            ),
                            Text(
                              pizza.name,
                              style: TextStyle(
                                  color: Colors.blueGrey[200],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.blueGrey[100],
                              ),
                            ),
                            Text(
                              pizza.address,
                              style: TextStyle(
                                  color: Colors.blueGrey[200],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
