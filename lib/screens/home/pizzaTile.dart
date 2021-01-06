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
        child: ListTile(
            leading: CircleAvatar(
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
            title: Row(
              children: [
                Text(
                  'Customer\'s name: ',
                  style: TextStyle(color: Colors.blueGrey[100], fontSize: 14),
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
            subtitle: pizza.extraCheese
                ? Row(
                    children: [
                      Icon(
                        Icons.check_circle_sharp,
                        color: Colors.blueGrey[100],
                      ),
                      Text(
                        ' Extra cheese',
                        style: TextStyle(
                            color: Colors.blueGrey[200],
                            fontSize: 15,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Icon(
                        Icons.not_interested,
                        color: Colors.blueGrey[100],
                      ),
                      Text(
                        ' No Extra cheese',
                        style: TextStyle(
                            color: Colors.blueGrey[200],
                            fontSize: 15,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  )),
      ),
    );
  }
}
