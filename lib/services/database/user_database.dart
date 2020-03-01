import 'package:bethriftytoday/models/currency.dart';
import 'package:bethriftytoday/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabaseService {
  final User user;
  static Firestore _db = Firestore.instance;
  final CollectionReference userCollection = _db.collection('users');

  UserDatabaseService(this.user);

  Future<User> get getUserDocument => userCollection
      .document(user.uid)
      .get()
      .then((user) => User.fromJson(user.data));

  Stream<User> get userDocument => userCollection
      .document(user.uid)
      .snapshots()
      .map((user) => User.fromJson(user.data));

  Future<bool> get checkIfUserExists => userCollection
      .document(user.uid)
      .get()
      .then((user) => user.data['currency'] != null);

  Future setUserData() async {
    return await userCollection.document(this.user.uid).setData({
      ...user.toJson(),
      'createdAt': DateTime.now(),
    }, merge: true);
  }

  Future updateUserName(String name) async {
    var userDoc = await getUserDocument;
    return await userCollection.document(this.user.uid).updateData({
      ...userDoc.toJson(),
      'name': name,
    });
  }

  Future updateUserCurrency(Currency currency) async {
    var userDoc = await getUserDocument;
    return await userCollection.document(this.user.uid).updateData({
      ...userDoc.toJson(),
      'currency': currency.toJson(),
    });
  }
}
