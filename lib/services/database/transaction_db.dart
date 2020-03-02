import 'package:bethriftytoday/models/transaction.dart';
import 'package:bethriftytoday/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class TransactionDatabaseService {
  final User user;
  static Firestore _db = Firestore.instance;
  CollectionReference _transactionCollection;

  TransactionDatabaseService(this.user) {
    this._transactionCollection = _db
        .collection('users')
        .document(this.user?.uid)
        .collection('transactions');
  }

  Stream<List<Transaction>> get transactions => _transactionCollection
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((x) {
        return x.documents.map((y) {
          return Transaction.fromJson(y.data);
        }).toList();
      });

  Map<String, List<Transaction>> groupTransactionsByDate(
    List<Transaction> transactions,
  ) {
    return groupBy<Transaction, String>(transactions, (txn) {
      return DateFormat('dd MMMM y').format(txn.timestamp);
    });
  }

  Stream<double> get balance => _transactionCollection.snapshots().map((x) {
        var transactions = x.documents.map((y) {
          return Transaction.fromJson(y.data);
        }).toList();

        return transactions.fold(
            0, (value, element) => (value + element.amount));
      });
}
