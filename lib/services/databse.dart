import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbase_example/modals/pizza.dart';

class DatabaseService {
//Getting specific id
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference pizzaCollection =
      Firestore.instance.collection('pizza');

  Future updateUserData(String name, int size, bool extraCheese) async {
    return await pizzaCollection.document(uid).setData({
      'name': name,
      'size': size,
      'extraCheese': extraCheese,
    });
  }

  // brew list from snapshot
  List<Pizza> _pizzaListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Pizza(
        name: doc.data['name'] ?? '',
        size: doc.data['size'] ?? '',
        extraCheese: doc.data['extraCheese'] ?? false,
      );
    }).toList();
  }

//get pizza streem
  Stream<List<Pizza>> get pizza {
    return pizzaCollection.snapshots().map(_pizzaListFromSnapshot);
  }
}
