import 'package:bethriftytoday/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryDatabaseService {
  static Firestore _db = Firestore.instance;
  final CollectionReference _categoryCollection = _db.collection('categories');

  Stream<List<Category>> get categories => _categoryCollection
          .orderBy('name', descending: false)
          .snapshots()
          .map((x) {
        return x.documents.map((y) {
          return Category.fromJson(y.data);
        }).toList();
      });
}
