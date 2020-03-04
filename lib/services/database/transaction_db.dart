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
    _transactionCollection = _db
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

  Stream<double> get balance => _transactionCollection.snapshots().map((x) {
        var transactions = x.documents.map((y) {
          return Transaction.fromJson(y.data);
        }).toList();

        return transactions.fold(
            0, (value, element) => (value + element.amount));
      });

  Stream<List<Transaction>> expensesByMonth(DateTime date) {
    var firstDay = new DateTime(date.year, date.month, 1);
    var lastDay = new DateTime(date.year, date.month + 1, 0);

    return _transactionCollection
        .where('category.type', isEqualTo: 'expense')
        .where('timestamp', isGreaterThanOrEqualTo: firstDay)
        .where('timestamp', isLessThanOrEqualTo: lastDay)
        .snapshots()
        .map((x) {
      return x.documents.map((y) {
        return Transaction.fromJson(y.data);
      }).toList();
    });
  }

  addTransaction(Transaction transaction) async {
    var doc = await _transactionCollection.add(transaction.toJson());
    return doc.updateData({'id': doc.documentID});
  }

  updateTransaction(Transaction transaction) {
    return _transactionCollection
        .document(transaction.id)
        .updateData(transaction.toJson());
  }

  deleteTransaction(Transaction transaction) async {
    await _transactionCollection.document(transaction.id).delete();
  }

  Map<String, List<Transaction>> groupTransactionsByDate(
    List<Transaction> transactions,
  ) {
    return groupBy<Transaction, String>(transactions, (txn) {
      return DateFormat('dd MMMM y').format(txn.timestamp);
    });
  }
}
