import 'package:bethriftytoday/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CurrencyDatabaseService {
  static Firestore _db = Firestore.instance;
  final CollectionReference _currencyCollection = _db.collection('currencies');

  Stream<List<Currency>> get currencies =>
      _currencyCollection.snapshots().map((x) {
        return x.documents.map((y) {
          return Currency.fromJson(y.data);
        }).toList();
      });
}
