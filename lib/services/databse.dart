import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbase_example/modals/pizza.dart';
import 'package:firbase_example/modals/user.dart';

class DatabaseService {
//Getting specific id
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference pizzaCollection =
      Firestore.instance.collection('pizza');

  Future updateUserData(String pizzaType, String name, String address, int size,
      bool extraCheese) async {
    return await pizzaCollection.document(uid).setData({
      'pizzaType': pizzaType,
      'name': name,
      'address': address,
      'size': size,
      'extraCheese': extraCheese,
    });
  }

  //user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      address: snapshot.data['address'],
      size: snapshot.data['size'],
      extraCheese: snapshot.data['extraCheese'],
    );
  }

  // pizza list from snapshot
  List<Pizza> _pizzaListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Pizza(
        pizzaType: doc.data['pizzaType'] ?? '',
        name: doc.data['name'] ?? '',
        address: doc.data['address'] ?? '',
        size: doc.data['size'] ?? '',
        extraCheese: doc.data['extraCheese'] ?? false,
      );
    }).toList();
  }

//get pizza streem
  Stream<List<Pizza>> get pizza {
    return pizzaCollection.snapshots().map(_pizzaListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return pizzaCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
