import 'package:cloud_firestore/cloud_firestore.dart';

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

//get pizza streem
  Stream<QuerySnapshot> get pizza {
    return pizzaCollection.snapshots();
  }
}
