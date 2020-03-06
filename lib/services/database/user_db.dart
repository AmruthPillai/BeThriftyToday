import 'package:bethriftytoday/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabaseService {
  final User user;
  static Firestore _db = Firestore.instance;
  DocumentReference _userDocument;

  UserDatabaseService(this.user) {
    _userDocument = _db.collection('users').document(this.user.uid);
  }

  Future<User> fetchUserDocument() =>
      _userDocument.get().then((user) => User.fromJson(user.data));

  Stream<User> get userDocument =>
      _userDocument.snapshots().map((user) => User.fromJson(user.data));

  Future<bool> get checkIfUserExists async {
    try {
      var snapshot = await _userDocument.get();
      return (snapshot == null) ? false : snapshot.data['currency'] != null;
    } catch (e) {
      return false;
    }
  }

  Future createUser() async {
    return await _userDocument.setData({
      ...user.toJson(),
      'createdAt': DateTime.now(),
    }, merge: true);
  }

  Future updateUserName(String name) async {
    var userDoc = await fetchUserDocument();
    return _userDocument.updateData({
      ...userDoc.toJson(),
      'name': name,
    });
  }

  Future updateUserCurrency(Currency currency) async {
    var userDoc = await fetchUserDocument();
    return _userDocument.updateData({
      ...userDoc.toJson(),
      'currency': currency.toJson(),
    });
  }

  Future updateUserBudget(double budget) async {
    var userDoc = await fetchUserDocument();
    return _userDocument.updateData({
      ...userDoc.toJson(),
      'budget': budget,
    });
  }
}
