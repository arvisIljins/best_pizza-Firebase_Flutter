class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final String pizzaType;
  final String name;
  final String address;
  final int size;
  final bool extraCheese;

  UserData(
      {this.uid,
      this.pizzaType,
      this.name,
      this.address,
      this.size,
      this.extraCheese});
}
