import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference pizzaCollection =
      Firestore.instance.collection('pizza');
}
