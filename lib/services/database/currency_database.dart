import 'package:bethriftytoday/models/currency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CurrencyDatabaseService {
  static Firestore _db = Firestore.instance;
  final CollectionReference currencyCollection = _db.collection('currencies');

  Stream<List<Currency>> get currencies =>
      currencyCollection.snapshots().map((x) {
        return x.documents.map((y) {
          return Currency.fromJson(y.data);
        }).toList();
      });
}
