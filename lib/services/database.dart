import 'package:bethriftytoday/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final User user;
  static Firestore _db = Firestore.instance;
  final CollectionReference userCollection = _db.collection('users');

  DatabaseService(this.user);

  Future<bool> get checkIfUserExists =>
      userCollection.document(user.uid).get().then((user) => user.exists);

  setUserData() {
    return userCollection.document(this.user.uid).setData({
      ...user.toJson(),
      'createdAt': DateTime.now(),
    }, merge: true);
  }
}
